import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_clip_oval_builder.g.dart';

/// Builder that can build a [ClipOval] widget.
@jsonWidget
abstract class _JsonClipOvalBuilder extends JsonWidgetBuilder {
  const _JsonClipOvalBuilder({
    required super.args,
  });

  @override
  ClipOval buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
