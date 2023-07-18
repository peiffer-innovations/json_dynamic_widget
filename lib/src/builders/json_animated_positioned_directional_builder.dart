import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_positioned_directional_builder.g.dart';

/// Builder that can build an [AnimatedPositionedDirectional] widget.
@jsonWidget
abstract class _JsonAnimatedPositionedDirectionalBuilder
    extends JsonWidgetBuilder {
  const _JsonAnimatedPositionedDirectionalBuilder({
    required super.numSupportedChildren,
  });

  @override
  AnimatedPositionedDirectional buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
