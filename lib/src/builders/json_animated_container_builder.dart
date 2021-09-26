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
    required this.clipBehavior,
    this.color,
    this.constraints,
    this.curve,
    this.decoration,
    required this.duration,
    this.foregroundDecoration,
    this.height,
    this.margin,
    this.onEnd,
    this.padding,
    this.transform,
    this.transformAlignment,
    this.width,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_container';

  final AlignmentGeometry? alignment;
  final Clip clipBehavior;
  final Color? color;
  final BoxConstraints? constraints;
  final Curve? curve;
  final BoxDecoration? decoration;
  final Duration duration;
  final BoxDecoration? foregroundDecoration;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onEnd;
  final EdgeInsetsGeometry? padding;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final double? width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment: <AlignmentGeometry>,
  ///   "clipBehavior": <Clip>,
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
  ///   "transformAlignment": <TransformAlignment>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedContainerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedContainerBuilder? result;

    if (map != null) {
      result = JsonAnimatedContainerBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.none,
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
        )!,
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
        transformAlignment: ThemeDecoder.decodeAlignment(
          map['transformAlignment'],
          validate: false,
        ),
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

    return _JsonAnimatedContainer(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedContainer extends StatefulWidget {
  _JsonAnimatedContainer({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedContainerBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedContainerState createState() => _JsonAnimatedContainerState();
}

class _JsonAnimatedContainerState extends State<_JsonAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: widget.builder.alignment,
      clipBehavior: widget.builder.clipBehavior,
      color: widget.builder.color,
      constraints: widget.builder.constraints,
      curve: widget.builder.curve ?? Curves.linear,
      decoration: widget.builder.decoration,
      duration: widget.builder.duration,
      foregroundDecoration: widget.builder.foregroundDecoration,
      height: widget.builder.height,
      margin: widget.builder.margin,
      onEnd: widget.builder.onEnd,
      padding: widget.builder.padding,
      transform: widget.builder.transform,
      transformAlignment: widget.builder.transformAlignment,
      width: widget.builder.width,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
