import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedAlign] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedAlignBuilder extends JsonWidgetBuilder {
  JsonAnimatedAlignBuilder({
    required this.alignment,
    this.curve,
    required this.duration,
    this.heightFactor,
    this.onEnd,
    this.widthFactor,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_align';

  final AlignmentGeometry alignment;
  final Curve? curve;
  final Duration duration;
  final double? heightFactor;
  final VoidCallback? onEnd;
  final double? widthFactor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "heightFactor": <double>,
  ///   "onEnd": <VoidCallback>,
  ///   "widthFactor": <double>
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedAlignBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedAlignBuilder? result;

    if (map != null) {
      result = JsonAnimatedAlignBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        )!,
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        heightFactor: JsonClass.parseDouble(map['heightFactor']),
        onEnd: map['onEnd'],
        widthFactor: JsonClass.parseDouble(map['widthFactor']),
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

    return _JsonAnimatedAlign(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedAlign extends StatefulWidget {
  _JsonAnimatedAlign({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedAlignBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedAlignState createState() => _JsonAnimatedAlignState();
}

class _JsonAnimatedAlignState extends State<_JsonAnimatedAlign> {
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.builder.alignment,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      heightFactor: widget.builder.heightFactor,
      onEnd: widget.builder.onEnd,
      widthFactor: widget.builder.widthFactor,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
