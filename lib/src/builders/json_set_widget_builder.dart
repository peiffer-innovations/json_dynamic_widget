import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_set_widget_builder.g.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.
@jsonWidget
abstract class _JsonSetWidgetBuilder extends JsonWidgetBuilder {
  _JsonSetWidgetBuilder({
    required JsonSetWidgetBuilderModel model,
    required super.numSupportedChildren,
    required JsonWidgetRegistry? registry,
  }) : _model = model {
    final innerRegistry = registry ?? JsonWidgetRegistry.instance;
    _model.widgets?.forEach(
      (key, value) => innerRegistry.setValue(
        key,
        value,
        originator: null,
      ),
    );
  }

  final JsonSetWidgetBuilderModel _model;

  @override
  void remove(JsonWidgetData data) {
    _model.widgets?.forEach(
      (key, _) => data.registry.removeValue(
        key,
        originator: null,
      ),
    );

    super.remove(data);
  }

  @override
  _SetWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SetWidget extends StatelessWidget {
  const _SetWidget({
    this.child,
    required this.widgets,
  });

  final Widget? child;
  final Map<String, Widget>? widgets;

  @override
  Widget build(BuildContext context) => child ?? const SizedBox();
}
