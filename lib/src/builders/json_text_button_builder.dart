import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_button_builder.g.dart';

/// Builder that can build an [TextButton] widget.
@jsonWidget
abstract class _JsonTextButtonBuilder extends JsonWidgetBuilder {
  const _JsonTextButtonBuilder({
    required super.numSupportedChildren,
  });

  @override
  TextButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
