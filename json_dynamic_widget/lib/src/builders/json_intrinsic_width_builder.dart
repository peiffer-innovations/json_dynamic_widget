import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_intrinsic_width_builder.g.dart';

/// Builder that can build an [IntrinsicWidth] widget.
@jsonWidget
abstract class _JsonIntrinsicWidthBuilder extends JsonWidgetBuilder {
  const _JsonIntrinsicWidthBuilder();

  @override
  IntrinsicWidth buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
