import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_overflow_box_builder.g.dart';

/// Builder that can build an [OverflowBox] widget.
@jsonWidget
abstract class _JsonOverflowBoxBuilder extends JsonWidgetBuilder {
  const _JsonOverflowBoxBuilder({required super.args});

  @override
  OverflowBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
