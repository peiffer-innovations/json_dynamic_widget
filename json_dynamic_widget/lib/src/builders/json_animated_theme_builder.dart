import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_theme_builder.g.dart';

/// Builder that can build an [AnimatedTheme] widget.
@jsonWidget
abstract class _JsonAnimatedThemeBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedThemeBuilder({
    required super.args,
  });

  @override
  AnimatedTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
