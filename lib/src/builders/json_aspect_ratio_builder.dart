import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_aspect_ratio_builder.g.dart';

/// Builder that can build an [AspectRatio] widget.
@jsonWidget
abstract class _JsonAspectRatioBuilder extends JsonWidgetBuilder {
  const _JsonAspectRatioBuilder();

  @override
  AspectRatio buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
