import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedPhysicalModel] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedPhysicalModelBuilder extends JsonWidgetBuilder {
  JsonAnimatedPhysicalModelBuilder({
    this.animateColor,
    this.animateShadowColor,
    this.borderRadius,
    this.clipBehavior,
    required this.color,
    this.curve,
    required this.duration,
    required this.elevation,
    this.onEnd,
    required this.shadowColor,
    required this.shape,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_physical_model';

  final bool? animateColor;
  final bool? animateShadowColor;
  final BorderRadius? borderRadius;
  final Clip? clipBehavior;
  final Color color;
  final Curve? curve;
  final Duration duration;
  final double elevation;
  final VoidCallback? onEnd;
  final Color shadowColor;
  final BoxShape shape;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animateColor: <bool>,
  ///   "animateShadowColor: <bool>,
  ///   "borderRadius: <BorderRadius>,
  ///   "clipBehavior: <Clip>,
  ///   "color": <Color>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "elevation": <double>,
  ///   "onEnd": <VoidCallback>,
  ///   "shadowColor": <Color>,
  ///   "shape": <BoxShape>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].\
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBoxShape]
  static JsonAnimatedPhysicalModelBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedPhysicalModelBuilder? result;

    if (map != null) {
      result = JsonAnimatedPhysicalModelBuilder(
        animateColor: JsonClass.parseBool(
          map['animateColor'] ?? true,
        ),
        animateShadowColor: JsonClass.parseBool(
          map['animateShadowColor'] ?? true,
        ),
        borderRadius: ThemeDecoder.decodeBorderRadius(
              map['borderRadius'],
            ) ??
            BorderRadius.zero,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
            ) ??
            Clip.none,
        color: ThemeDecoder.decodeColor(
          map['color'],
        )!,
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        elevation: JsonClass.parseDouble(
          map['elevation'],
        )!,
        onEnd: map['onEnd'],
        shadowColor: ThemeDecoder.decodeColor(
          map['shadowColor'],
        )!,
        shape: ThemeDecoder.decodeBoxShape(
          map['shape'],
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

    return _JsonAnimatedPhysicalModel(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedPhysicalModel extends StatefulWidget {
  _JsonAnimatedPhysicalModel({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedPhysicalModelBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedPhysicalModelState createState() =>
      _JsonAnimatedPhysicalModelState();
}

class _JsonAnimatedPhysicalModelState
    extends State<_JsonAnimatedPhysicalModel> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      animateColor: widget.builder.animateColor ?? true,
      animateShadowColor: widget.builder.animateShadowColor ?? true,
      borderRadius: widget.builder.borderRadius ?? BorderRadius.zero,
      clipBehavior: widget.builder.clipBehavior ?? Clip.none,
      color: widget.builder.color,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      elevation: widget.builder.elevation,
      onEnd: widget.builder.onEnd,
      shadowColor: widget.builder.shadowColor,
      shape: widget.builder.shape,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
