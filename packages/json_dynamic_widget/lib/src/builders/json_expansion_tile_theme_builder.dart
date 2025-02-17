import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_expansion_tile_theme_builder.g.dart';

/// Builder that can build a [ExpansionTileTheme] widget.
@jsonWidget
abstract class _JsonExpansionTileThemeBuilder extends JsonWidgetBuilder {
  const _JsonExpansionTileThemeBuilder({required super.args});

  @override
  ExpansionTileTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
