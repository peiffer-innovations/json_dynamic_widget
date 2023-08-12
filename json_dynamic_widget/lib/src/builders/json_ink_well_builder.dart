import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_ink_well_builder.g.dart';

/// Builder that can build an [InkWell] widget.
@jsonWidget
abstract class _JsonInkWellBuilder extends JsonWidgetBuilder {
  const _JsonInkWellBuilder();

  @override
  InkWell buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
