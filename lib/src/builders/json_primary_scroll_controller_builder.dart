import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_primary_scroll_controller_builder.g.dart';

/// Builder that can build an [PrimaryScrollController] widget.
@jsonWidget
abstract class _JsonPrimaryScrollControllerBuilder extends JsonWidgetBuilder {
  const _JsonPrimaryScrollControllerBuilder({
    required super.numSupportedChildren,
  });

  @override
  PrimaryScrollController buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
