import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [AnimatedPositioned] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedPositionedBuilder extends JsonWidgetBuilder {
  JsonAnimatedPositionedBuilder({
    this.bottom,
    this.curve,
    required this.duration,
    this.height,
    this.left,
    this.onEnd,
    this.right,
    this.top,
    this.width,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_positioned';

  final double? bottom;
  final Curve? curve;
  final Duration duration;
  final double? height;
  final double? left;
  final VoidCallback? onEnd;
  final double? right;
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
  ///   "height": <double>,
  ///   "left": <double>,
  ///   "onEnd": <VoidCallback>,
  ///   "right": <double>,
  ///   "top": <double>,
  ///   "width": <double>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedPositionedBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedPositionedBuilder? result;

    if (map != null) {
      result = JsonAnimatedPositionedBuilder(
        bottom: JsonClass.parseDouble(map['bottom']),
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        height: JsonClass.parseDouble(map['height']),
        left: JsonClass.parseDouble(map['left']),
        onEnd: map['onEnd'],
        right: JsonClass.parseDouble(map['right']),
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

    return _JsonAnimatedPositioned(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedPositioned extends StatefulWidget {
  _JsonAnimatedPositioned({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedPositionedBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedPositionedState createState() => _JsonAnimatedPositionedState();
}

class _JsonAnimatedPositionedState extends State<_JsonAnimatedPositioned> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.builder.bottom,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      height: widget.builder.height,
      left: widget.builder.left,
      onEnd: widget.builder.onEnd,
      right: widget.builder.right,
      top: widget.builder.top,
      width: widget.builder.top,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
