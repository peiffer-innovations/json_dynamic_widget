import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_outlined_button_builder.g.dart';

/// Builder that can build an [OutlinedButton] widget.
@jsonWidget
abstract class _JsonOutlinedButtonBuilder extends JsonWidgetBuilder {
  const _JsonOutlinedButtonBuilder({
    required super.numSupportedChildren,
  });

  @override
  OutlinedButton buildCustom({
    childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
