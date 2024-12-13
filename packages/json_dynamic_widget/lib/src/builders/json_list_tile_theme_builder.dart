import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_list_tile_theme_builder.g.dart';

/// Builder that can build an [ListTileTheme] widget.
@jsonWidget
abstract class _JsonListTileThemeBuilder extends JsonWidgetBuilder {
  const _JsonListTileThemeBuilder({
    required super.args,
  });

  @override
  ListTileTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
