import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_tween_animation_builder_builder.g.dart';

/// Builder that can build an [TweenAnimationBuilder] widget.
@jsonWidget
abstract class _JsonTweenAnimationBuilderBuilder extends JsonWidgetBuilder {
  const _JsonTweenAnimationBuilderBuilder();

  @JsonArgDecoder('tween')
  Tween<Object> _decodeTween({
    required dynamic value,
  }) =>
      value as Tween<Object>;

  @override
  TweenAnimationBuilder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
