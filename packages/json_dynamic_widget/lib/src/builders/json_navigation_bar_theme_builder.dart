import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_navigation_bar_theme_builder.g.dart';

/// Builder that can build an [NavigationBarTheme] widget.
@jsonWidget
abstract class _JsonNavigationBarThemeBuilder extends JsonWidgetBuilder {
  const _JsonNavigationBarThemeBuilder({required super.args});

  @override
  NavigationBarTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
