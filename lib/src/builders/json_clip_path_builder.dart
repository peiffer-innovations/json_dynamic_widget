import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_clip_path_builder.g.dart';

/// Builder that can build a [ClipPath] widget.
@jsonWidget
abstract class _JsonClipPathBuilder extends JsonWidgetBuilder {
  const _JsonClipPathBuilder({
    required super.numSupportedChildren,
  });

  @override
  ClipPath buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
