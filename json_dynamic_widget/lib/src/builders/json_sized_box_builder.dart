import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sized_box_builder.g.dart';

/// Builder that can build an [SizedBox] widget.
@jsonWidget
abstract class _JsonSizedBoxBuilder extends JsonWidgetBuilder {
  const _JsonSizedBoxBuilder({
    required super.args,
  });

  @override
  SizedBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
