import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_set_default_value_builder.g.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.
@jsonWidget
abstract class _JsonSetDefaultValueBuilder extends JsonWidgetBuilder {
  const _JsonSetDefaultValueBuilder({
    required super.numSupportedChildren,
  });

  @override
  _SetDefaultValue buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SetDefaultValue extends StatefulWidget {
  const _SetDefaultValue({
    @JsonBuilderParam() this.childBuilder,
    @JsonBuilderParam() required this.data,
    super.key,
    this.values = const {},
  });

  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final Map<String, dynamic> values;

  @override
  State createState() => _SetDefaultValueState();
}

class _SetDefaultValueState extends State<_SetDefaultValue> {
  @override
  void initState() {
    super.initState();

    widget.values.forEach((key, value) {
      if (widget.data.registry.getValue(key) == null) {
        widget.data.registry.setValue(
          key,
          value,
          originator: null,
        );
      }
    });
  }

  @override
  void dispose() {
    widget.values.forEach(
      (key, _) => widget.data.registry.removeValue(
        key,
        originator: null,
      ),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    assert(
      data.children?.length == 1 || data.children?.isNotEmpty != true,
      '[JsonSetDefaultValueBuilder] only supports zero or one child.',
    );

    var child = data.children?.isNotEmpty == true ? data.children![0] : null;
    child = child?.recreate();

    return child?.build(
          childBuilder: widget.childBuilder,
          context: context,
        ) ??
        const SizedBox();
  }
}
