import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedContainer] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedContainerBuilder extends JsonWidgetBuilder {
  JsonAnimatedContainerBuilder({
    this.alignment,
    this.color,
    this.constraints,
    this.curve,
    this.decoration,
    @required this.duration,
    this.foregroundDecoration,
    this.height,
    this.margin,
    this.onEnd,
    this.padding,
    this.transform,
    this.width,
  }) : assert(duration != null);

  static const type = 'animated_container';

  final AlignmentGeometry alignment;
  final Color color;
  final BoxConstraints constraints;
  final Curve curve;
  final BoxDecoration decoration;
  final Duration duration;
  final BoxDecoration foregroundDecoration;
  final double height;
  final EdgeInsetsGeometry margin;
  final VoidCallback onEnd;
  final EdgeInsetsGeometry padding;
  final Matrix4 transform;
  final double width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment: <AlignmentGeometry>,
  ///   "color": <Color>,
  ///   "constraints": <BoxConstraints>,
  ///   "curve": <Curve>,
  ///   "decoration": <BoxDecoration>,
  ///   "duration": <int; millis>,
  ///   "foregroundDecoration": <BoxDecoration>,
  ///   "height: <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "onEnd": <VoidCallback>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "transform": <Matrix4>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedContainerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAnimatedContainerBuilder result;

    if (map != null) {
      result = JsonAnimatedContainerBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        constraints: ThemeDecoder.decodeBoxConstraints(
          map['constraints'],
          validate: false,
        ),
        curve: map['curve'] ?? Curves.linear,
        decoration: ThemeDecoder.decodeBoxDecoration(
          map['decoration'],
          validate: false,
        ),
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        ),
        foregroundDecoration: ThemeDecoder.decodeBoxDecoration(
          map['foregroundDecoration'],
          validate: false,
        ),
        height: JsonClass.parseDouble(map['height']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['margin'],
          validate: false,
        ),
        onEnd: map['onEnd'],
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ),
        transform: ThemeDecoder.decodeMatrix4(
          map['matrix4'],
          validate: false,
        ),
        width: JsonClass.parseDouble(map['width']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonAnimatedContainerBuilder] only supports exactly one child.',
    );

    return _JsonAnimatedContainer(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonAnimatedContainer extends StatefulWidget {
  _JsonAnimatedContainer({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonAnimatedContainerBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedContainerState createState() => _JsonAnimatedContainerState();
}

class _JsonAnimatedContainerState extends State<_JsonAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: widget.builder.alignment,
      color: widget.builder.color,
      constraints: widget.builder.constraints,
      curve: widget.builder.curve,
      decoration: widget.builder.decoration,
      duration: widget.builder.duration,
      foregroundDecoration: widget.builder.foregroundDecoration,
      height: widget.builder.height,
      margin: widget.builder.margin,
      onEnd: widget.builder.onEnd,
      padding: widget.builder.padding,
      transform: widget.builder.transform,
      width: widget.builder.width,
      child: widget.data.children[0].build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
