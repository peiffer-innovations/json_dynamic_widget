import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_default_text_style_builder.g.dart';

/// Builder that can build an [AnimatedDefaultTextStyle] widget.
@jsonWidget
abstract class _JsonAnimatedDefaultTextStyleBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedDefaultTextStyleBuilder();

  @override
  AnimatedDefaultTextStyle buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
