import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_popup_menu_button_builder.g.dart';

/// Builder that can build an [PopupMenuButton] widget.
@jsonWidget
abstract class _JsonPopupMenuButtonBuilder extends JsonWidgetBuilder {
  const _JsonPopupMenuButtonBuilder({required super.args});

  @override
  PopupMenuButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
