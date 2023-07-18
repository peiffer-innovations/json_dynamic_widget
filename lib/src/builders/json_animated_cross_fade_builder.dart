import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_cross_fade_builder.g.dart';

/// Builder that can build an [AnimatedCrossFade] widget.
@jsonWidget
abstract class _JsonAnimatedCrossFadeBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedCrossFadeBuilder({
    required super.numSupportedChildren,
  });

  @JsonParamDecoder('firstChild')
  Widget _decodeFirstChild({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) =>
      getChild(data, index: 0).build(
        context: context,
        childBuilder: childBuilder,
      );

  @JsonParamDecoder('secondChild')
  Widget _decodeSecondChild({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) =>
      getChild(data, index: 1).build(
        context: context,
        childBuilder: childBuilder,
      );

  @override
  AnimatedCrossFade buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
