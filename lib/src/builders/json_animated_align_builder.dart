import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [JsonAnimatedAlignBuilder] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedAlignBuilder extends JsonWidgetBuilder {
  JsonAnimatedAlignBuilder({
    @required this.alignment,
    this.curve,
    @required this.duration,
    this.onEnd,
  });

  static const type = 'animated_align';

  final AlignmentGeometry alignment;
  final Curve curve;
  final Duration duration;
  final VoidCallback onEnd;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "onEnd": <VoidCallback>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedAlignBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAnimatedAlignBuilder result;

    if (map != null) {
      result = JsonAnimatedAlignBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        ),
        onEnd: map['onEnd'],
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
      '[JsonAnimatedAlignBuilder] only supports exactly one child.',
    );

    return _JsonAnimatedAlign(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonAnimatedAlign extends StatefulWidget {
  _JsonAnimatedAlign({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonAnimatedAlignBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedAlignState createState() => _JsonAnimatedAlignState();
}

class _JsonAnimatedAlignState extends State<_JsonAnimatedAlign> {
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.builder.alignment,
      curve: widget.builder.curve,
      duration: widget.builder.duration,
      onEnd: widget.builder.onEnd,
      child: widget.data.children[0].build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
