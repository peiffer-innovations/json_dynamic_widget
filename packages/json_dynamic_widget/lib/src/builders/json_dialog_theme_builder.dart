import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_dialog_theme_builder.g.dart';

/// Builder that can build a [DialogTheme] widget.
@jsonWidget
abstract class _JsonDialogThemeBuilder extends JsonWidgetBuilder {
  const _JsonDialogThemeBuilder({required super.args});

  @override
  DialogTheme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
