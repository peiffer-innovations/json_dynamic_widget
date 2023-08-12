import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_padding_builder.g.dart';

/// Builder that can build an [AnimatedPadding] widget.
@jsonWidget
abstract class _JsonAnimatedPaddingBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedPaddingBuilder();

  @override
  AnimatedPadding buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
