import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_clip_rect_builder.g.dart';

/// Builder that can build a [ClipRect] widget.
@jsonWidget
abstract class _JsonClipRectBuilder extends JsonWidgetBuilder {
  const _JsonClipRectBuilder();

  @override
  ClipRect buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
