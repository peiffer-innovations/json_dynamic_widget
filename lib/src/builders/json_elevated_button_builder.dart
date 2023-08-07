import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_elevated_button_builder.g.dart';

/// Builder that can build an [ElevatedButton] widget.
@jsonWidget
abstract class _JsonElevatedButtonBuilder extends JsonWidgetBuilder {
  const _JsonElevatedButtonBuilder({
    required super.numSupportedChildren,
  });

  @override
  ElevatedButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
