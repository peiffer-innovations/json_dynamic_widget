import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_chip_theme_builder.g.dart';

/// Builder that can build a [Card] widget.
@jsonWidget
abstract class _JsonChipThemeBuilder extends JsonWidgetBuilder {
  const _JsonChipThemeBuilder({required super.args});

  @override
  ChipTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
