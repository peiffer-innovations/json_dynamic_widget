import 'package:dotted_border/dotted_border.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'dotted_border_builder.g.dart';

@jsonWidget
abstract class _DottedBorderBuilder extends JsonWidgetBuilder {
  const _DottedBorderBuilder({
    required super.numSupportedChildren,
  });

  @override
  DottedBorder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
