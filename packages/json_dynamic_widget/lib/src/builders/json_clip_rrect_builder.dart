import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_clip_rrect_builder.g.dart';

/// Builder that can build a [ClipRect] widget.
@JsonWidget(type: 'clip_rrect')
abstract class _JsonClipRRectBuilder extends JsonWidgetBuilder {
  const _JsonClipRRectBuilder({required super.args});

  @override
  ClipRRect buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
