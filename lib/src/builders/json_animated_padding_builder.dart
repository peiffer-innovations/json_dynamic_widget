import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedPadding] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedPaddingBuilder extends JsonWidgetBuilder {
  JsonAnimatedPaddingBuilder({
    this.curve,
    required this.duration,
    this.onEnd,
    required this.padding,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_padding';

  final Curve? curve;
  final Duration duration;
  final VoidCallback? onEnd;
  final EdgeInsetsGeometry padding;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "onEnd": <VoidCallback>,
  ///   "padding": <EdgeInsetsGeometry>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedPaddingBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedPaddingBuilder? result;

    if (map != null) {
      result = JsonAnimatedPaddingBuilder(
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        onEnd: map['onEnd'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        )!,
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

    return _JsonAnimatedPadding(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedPadding extends StatefulWidget {
  _JsonAnimatedPadding({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedPaddingBuilder builder;
  final JsonWidgetData child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedPaddingState createState() => _JsonAnimatedPaddingState();
}

class _JsonAnimatedPaddingState extends State<_JsonAnimatedPadding> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      onEnd: widget.builder.onEnd,
      padding: widget.builder.padding,
      child: widget.child.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
