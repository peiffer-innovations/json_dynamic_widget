import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_tooltip_builder.g.dart';

/// Builder that can build an [Tooltip] widget.
@jsonWidget
abstract class _JsonTooltipBuilder extends JsonWidgetBuilder {
  const _JsonTooltipBuilder({
    required super.numSupportedChildren,
  });

  @override
  Tooltip buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
