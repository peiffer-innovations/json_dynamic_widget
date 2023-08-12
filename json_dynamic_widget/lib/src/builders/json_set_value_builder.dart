import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_set_value_builder.g.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.
///
/// When used closely to the child the value is being set for, it's recommended
/// to use the static reference to avoid the widget receiving the wrong value
/// during build and rebuild cycles.
@jsonWidget
abstract class _JsonSetValueBuilder extends JsonWidgetBuilder {
  const _JsonSetValueBuilder();

  @override
  _SetValue buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SetValue extends StatefulWidget {
  const _SetValue({
    this.child,
    @JsonBuildArg() this.childBuilder,
    @JsonBuildArg() required this.data,
    @JsonBuildArg() super.key,
    this.values,
  });

  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final Map? values;

  @override
  State createState() => _SetValueState();
}

class _SetValueState extends State<_SetValue> {
  @override
  void initState() {
    super.initState();

    widget.values?.forEach(
      (key, value) => widget.data.registry.setValue(
        key,
        value,
        originator: null,
      ),
    );
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.values?.forEach((key, _) => oldWidget.data.registry.removeValue(
          key,
          originator: null,
        ));

    widget.values?.forEach(
      (key, value) => widget.data.registry.setValue(
        key,
        value,
        originator: null,
      ),
    );
  }

  @override
  void dispose() {
    widget.values?.forEach((key, _) => widget.data.registry.removeValue(
          key,
          originator: null,
        ));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child?.build(
          childBuilder: widget.childBuilder,
          context: context,
          registry: widget.data.registry,
        ) ??
        const SizedBox();
  }
}
