import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_icon_button_builder.g.dart';

/// Builder that can build an [IconButton] widget.
@jsonWidget
abstract class _JsonIconButtonBuilder extends JsonWidgetBuilder {
  const _JsonIconButtonBuilder({required super.args});

  @override
  IconButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
