import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [AnimatedPositionedDirectional] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedPositionedDirectionalBuilder extends JsonWidgetBuilder {
  JsonAnimatedPositionedDirectionalBuilder({
    this.bottom,
    this.curve,
    required this.duration,
    this.end,
    this.height,
    this.onEnd,
    this.start,
    this.top,
    this.width,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_positioned_directional';

  final double? bottom;
  final Curve? curve;
  final Duration duration;
  final double? end;
  final double? height;
  final VoidCallback? onEnd;
  final double? start;
  final double? top;
  final double? width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "bottom": <double>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "end": <double>,
  ///   "height": <double>,
  ///   "onEnd": <VoidCallback>,
  ///   "start": <double>,
  ///   "top": <double>,
  ///   "width": <double>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedPositionedDirectionalBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedPositionedDirectionalBuilder? result;

    if (map != null) {
      result = JsonAnimatedPositionedDirectionalBuilder(
        bottom: JsonClass.parseDouble(map['bottom']),
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        end: JsonClass.parseDouble(map['end']),
        height: JsonClass.parseDouble(map['height']),
        onEnd: map['onEnd'],
        start: JsonClass.parseDouble(map['start']),
        top: JsonClass.parseDouble(map['top']),
        width: JsonClass.parseDouble(map['width']),
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
    var child = getChild(data);

    return _JsonAnimatedPositionedDirectional(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedPositionedDirectional extends StatefulWidget {
  _JsonAnimatedPositionedDirectional({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedPositionedDirectionalBuilder builder;
  final JsonWidgetData child;

  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedPositionedDirectionalState createState() =>
      _JsonAnimatedPositionedDirectionalState();
}

class _JsonAnimatedPositionedDirectionalState
    extends State<_JsonAnimatedPositionedDirectional> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositionedDirectional(
      bottom: widget.builder.bottom,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      end: widget.builder.end,
      height: widget.builder.height,
      onEnd: widget.builder.onEnd,
      start: widget.builder.start,
      top: widget.builder.top,
      width: widget.builder.width,
      child: widget.child.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
