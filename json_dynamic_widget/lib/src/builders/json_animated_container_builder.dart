import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_container_builder.g.dart';

/// Builder that can build an [AnimatedContainer] widget.
/// See the [fromDynamic] for the format.
@jsonWidget
abstract class _JsonAnimatedContainerBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedContainerBuilder();

  @override
  AnimatedContainer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
