import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_positioned_builder.g.dart';

/// Builder that can build an [AnimatedPositioned] widget.
@jsonWidget
abstract class _JsonAnimatedPositionedBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedPositionedBuilder({
    required super.numSupportedChildren,
  });

  @override
  AnimatedPositioned buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
