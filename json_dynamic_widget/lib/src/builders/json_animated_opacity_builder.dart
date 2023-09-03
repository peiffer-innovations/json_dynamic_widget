import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_opacity_builder.g.dart';

/// Builder that can build an [AnimatedOpacity] widget.
@jsonWidget
abstract class _JsonAnimatedOpacityBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedOpacityBuilder({
    required super.args,
  });

  @override
  AnimatedOpacity buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
