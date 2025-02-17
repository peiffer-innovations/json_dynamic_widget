import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_align_builder.g.dart';

/// Builder that can build an [Align] widget.
@jsonWidget
abstract class _JsonAnimatedAlignBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedAlignBuilder({required super.args});

  @override
  AnimatedAlign buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
