import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_set_widget_builder.g.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.
@jsonWidget
abstract class _JsonSetWidgetBuilder extends JsonWidgetBuilder {
  _JsonSetWidgetBuilder();

  @override
  _SetWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SetWidget extends StatefulWidget {
  const _SetWidget({
    this.child,
    @JsonBuildArg() this.childBuilder,
    @JsonBuildArg() required this.data,
    @JsonBuildArg() super.key,
    this.widgets,
  });

  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final Map? widgets;

  @override
  State createState() => _SetWidgetState();
}

class _SetWidgetState extends State<_SetWidget> {
  JsonWidgetData? child;

  @override
  void initState() {
    super.initState();

    widget.widgets?.forEach(
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
    oldWidget.widgets?.forEach((key, _) => oldWidget.data.registry.removeValue(
          key,
          originator: null,
        ));

    widget.widgets?.forEach(
      (key, value) => widget.data.registry.setValue(
        key,
        value,
        originator: null,
      ),
    );
  }

  @override
  void dispose() {
    widget.widgets?.forEach((key, _) => widget.data.registry.removeValue(
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
