import 'dart:async';

import 'package:json_conditional/json_conditional.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_conditional_builder.g.dart';

/// Builder that builds either the actual child widget or clears the child
/// widgets based on the result from the [conditional].
@jsonWidget
abstract class _JsonConditionalBuilder extends JsonWidgetBuilder {
  const _JsonConditionalBuilder();

  @JsonArgDecoder('conditional')
  Conditional _decodeConditiona({required dynamic value}) =>
      Conditional.fromDynamic(value);

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
    @JsonBuildArg() this.childBuilder,
    required this.conditional,
    @JsonBuildArg() required this.data,
    @JsonBuildArg() required this.model,
    Key? key,
    this.onFalse,
    this.onTrue,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
  final Conditional conditional;
  final JsonWidgetData data;
  final JsonConditionalBuilderModel model;
  final JsonWidgetData? onFalse;
  final JsonWidgetData? onTrue;

  @override
  State createState() => _ConditionalState();
}

class _ConditionalState extends State<_Conditional> {
  final Set<String> _keys = <String>{};

  late Conditional _conditional;
  late JsonWidgetData _data;
  StreamSubscription<WidgetValueChanged>? _subscription;

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
  void initState() {
    super.initState();

    _conditional = widget.conditional;
    _appendKeys(widget.conditional, _keys);
    _data = widget.data;
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
      _conditional = Conditional.fromDynamic(widget.model.conditional);

      if (mounted == true) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = _conditional.evaluate(_data.registry.values);

    final data = result ? widget.onTrue : widget.onFalse;

    Widget? child;
    if (data != null) {
      child = data.build(
        context: context,
        childBuilder: widget.childBuilder,
        registry: data.registry,
      );
    }

    return child ?? const SizedBox();
  }
}
