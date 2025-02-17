import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_data_table_theme_builder.g.dart';

/// Builder that can build an [DataTableTheme] widget.
@jsonWidget
abstract class _JsonDataTableThemeBuilder extends JsonWidgetBuilder {
  const _JsonDataTableThemeBuilder({required super.args})
    : super(preferredSizeWidget: true);

  @override
  DataTableTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
