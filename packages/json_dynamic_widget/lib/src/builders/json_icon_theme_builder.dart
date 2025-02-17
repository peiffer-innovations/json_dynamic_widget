import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_icon_theme_builder.g.dart';

/// Builder that can build a [IconTheme] widget.
@jsonWidget
abstract class _JsonIconThemeBuilder extends JsonWidgetBuilder {
  const _JsonIconThemeBuilder({required super.args});

  @override
  IconTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
