import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [TweenAnimationBuilder] widget.
/// See the [fromDynamic] for the format.
class JsonTweenAnimationBuilder extends JsonWidgetBuilder {
  JsonTweenAnimationBuilder({
    required this.builder,
    this.curve,
    required this.duration,
    this.onEnd,
    required this.tween,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'tween_animation';

  final ValueWidgetBuilder builder;
  final Curve? curve;
  final Duration duration;
  final VoidCallback? onEnd;
  final Tween tween;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "builder": <ValueWidgetBuilder>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "onEnd": <VoidCallback>,
  ///   "tween": <Tween>
  /// }
  /// ```
  ///
  /// As a note, the [ValueWidgetBuilder], [Curve], [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry]. The [Tween] can only be
  /// bound through a function reference.
  static JsonTweenAnimationBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonTweenAnimationBuilder? result;

    if (map != null) {
      result = JsonTweenAnimationBuilder(
        builder: map['builder'],
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        onEnd: map['onEnd'],
        tween: map['tween'],
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.length == 1 || data.children?.isNotEmpty != true,
      '[JsonTweenAnimationBuilder] only supports zero or one child.',
    );

    return _JsonTweenAnimation(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
    );
  }
}

class _JsonTweenAnimation extends StatefulWidget {
  _JsonTweenAnimation({
    required this.builder,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonTweenAnimationBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonTweenAnimationState createState() => _JsonTweenAnimationState();
}

class _JsonTweenAnimationState extends State<_JsonTweenAnimation> {
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        builder: widget.builder.builder,
        curve: widget.builder.curve ?? Curves.linear,
        duration: widget.builder.duration,
        onEnd: widget.builder.onEnd,
        tween: widget.builder.tween,
        child: widget.data.children?.length != 1
            ? null
            : widget.data.children![0].build(
                childBuilder: widget.childBuilder,
                context: context,
              ),
      );
}
