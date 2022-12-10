import 'dart:async';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_conditional/json_conditional.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that builds either the actual child widget or clears the child
/// widgets based on the result from the [conditional].
///
/// See the [fromDynamic] for the format.
class JsonConditionalBuilder extends JsonWidgetBuilder {
  JsonConditionalBuilder({
    required this.conditional,
    required this.keys,
    this.onFalse,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'conditional';

  final Conditional conditional;
  final Set<String> keys;
  final JsonWidgetData? onFalse;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "conditional": {
  ///     "conditions": <Conditional[]>,
  ///     "mode": <EvaluationMode>,
  ///     "values": <Map<String, dynamic>>
  ///   },
  ///   "onFalse": <JsonWidgetData>
  /// }
  /// ```
  ///
  /// The `conditional` value is required but the `onFalse` is not.  If the
  /// `onFalse` is `null` then the build will return an empty [SizedBox] when
  /// the `conditional` evaluates to [false].
  ///
  /// See also:
  ///  * [Conditional.fromDynamic]
  ///  * [EvaluationMode.fromCode]
  ///  * [JsonWidgetData.fromDynamic]
  static JsonConditionalBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonConditionalBuilder? result;

    if (map != null) {
      var conditional = Conditional.fromDynamic(map['conditional'])!;
      var keys = <String>{};
      _appendKeys(conditional, keys);

      result = JsonConditionalBuilder(
        conditional: conditional,
        keys: keys,
        onFalse: JsonWidgetData.fromDynamic(
          map['onFalse'],
          registry: registry,
        ),
      );
    }

    return result;
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
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return _ConditionalWidget(
      childBuilder: childBuilder,
      conditional: conditional,
      data: data,
      keys: keys,
      onFalse: onFalse,
    );
  }
}

class _ConditionalWidget extends StatefulWidget {
  _ConditionalWidget({
    this.childBuilder,
    required this.conditional,
    required this.data,
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
  _ConditionalWidgetState createState() => _ConditionalWidgetState();
}

class _ConditionalWidgetState extends State<_ConditionalWidget> {
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

      var builder = _data.builder() as JsonConditionalBuilder;
      _conditional = builder.conditional;
      _keys = builder.keys;
      _onFalse = builder.onFalse;

      if (mounted == true) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var result = _conditional.evaluate(_data.registry.values);

    var onTrue = _data.children?.isNotEmpty == true
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
          SizedBox();
    }

    return child;
  }
}
