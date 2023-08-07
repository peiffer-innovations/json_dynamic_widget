import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_intrinsic_height_builder.g.dart';

/// Builder that can build an [IntrinsicHeight] widget.
@jsonWidget
abstract class _JsonIntrinsicHeightBuilder extends JsonWidgetBuilder {
  const _JsonIntrinsicHeightBuilder({
    required super.numSupportedChildren,
  });

  @override
  IntrinsicHeight buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
