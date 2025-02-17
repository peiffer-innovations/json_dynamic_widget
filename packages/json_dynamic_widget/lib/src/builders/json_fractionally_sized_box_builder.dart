import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_fractionally_sized_box_builder.g.dart';

/// Builder that can build an [FractionallySizedBox] widget.
@jsonWidget
abstract class _JsonFractionallySizedBoxBuilder extends JsonWidgetBuilder {
  const _JsonFractionallySizedBoxBuilder({required super.args});

  @override
  FractionallySizedBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
