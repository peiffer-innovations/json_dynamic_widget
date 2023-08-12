import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_physical_model_builder.g.dart';

/// Builder that can build an [AnimatedPhysicalModel] widget.
@jsonWidget
abstract class _JsonAnimatedPhysicalModelBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedPhysicalModelBuilder();

  @override
  AnimatedPhysicalModel buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
