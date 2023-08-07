import 'dart:async';

import 'package:json_conditional/json_conditional.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_conditional_builder.g.dart';

/// Builder that builds either the actual child widget or clears the child
/// widgets based on the result from the [conditional].
@jsonWidget
abstract class _JsonConditionalBuilder extends JsonWidgetBuilder {
  _JsonConditionalBuilder({
    required super.numSupportedChildren,
    required JsonConditionalBuilderModel model,
  }) {
    _appendKeys(model.conditional, model.keys);
  }

  static void _appendKeys(
    Conditional conditional,
    Set<String> keys,
  ) {
    conditional.values?.forEach((key, _) => keys.add(key));
    conditional.conditions?.forEach(
      (conditional) => _appendKeys(conditional, keys),
    );
  }

  @override
  _Conditional buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Conditional extends StatefulWidget {
  const _Conditional({
    @JsonBuilderParam() this.childBuilder,
    required this.conditional,
    @JsonBuilderParam() required this.data,
    Key? key,
    required this.keys,
    this.onFalse,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
  final Conditional conditional;
  final JsonWidgetData data;
  final Set<String> keys;
  final JsonWidgetData? onFalse;

  @override
  State createState() => _ConditionalState();
}

class _ConditionalState extends State<_Conditional> {
  late Conditional _conditional;
  late JsonWidgetData _data;
  late Set<String> _keys;
  JsonWidgetData? _onFalse;
  StreamSubscription<WidgetValueChanged>? _subscription;

  @override
  void initState() {
    super.initState();

    _conditional = widget.conditional;
    _keys = widget.keys;
    _data = widget.data;
    _onFalse = widget.onFalse;
    _subscription = widget.data.registry.valueStream.listen(
      _handleSubscription,
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;

    super.dispose();
  }

  void _handleSubscription(WidgetValueChanged event) {
    if (_keys.contains(event.id) == true) {
      _data = _data.recreate();

      final builder = _data.builder() as JsonConditionalBuilder;
      _conditional = builder.model.conditional;
      _keys = builder.model.keys;
      _onFalse = builder.model.onFalse;

      if (mounted == true) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = _conditional.evaluate(_data.registry.values);

    final onTrue = _data.children?.isNotEmpty == true
        ? _data.children![0]
        : JsonWidgetBuilder.kDefaultChild;

    Widget? child;
    if (result == true) {
      if (_onFalse?.builder != null) {
        _onFalse!.builder().remove(_onFalse!);
      }

      child = onTrue.build(
        childBuilder: widget.childBuilder,
        context: context,
      );
    } else {
      onTrue.builder().remove(onTrue);
      child = _onFalse?.build(
            childBuilder: widget.childBuilder,
            context: context,
          ) ??
          const SizedBox();
    }

    return child;
  }
}
