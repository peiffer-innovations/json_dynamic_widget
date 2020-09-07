import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedDefaultTextStyle] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedDefaultTextStyleBuilder extends JsonWidgetBuilder {
  JsonAnimatedDefaultTextStyleBuilder({
    this.curve,
    @required this.duration,
    this.maxLines,
    this.onEnd,
    this.overflow,
    this.softWrap,
    @required this.style,
    this.textAlign,
    this.textHeightBehavior,
    this.textWidthBasis,
  })  : assert(duration != null),
        assert(style != null);

  static const type = 'animated_default_text_style';

  final Curve curve;
  final Duration duration;
  final int maxLines;
  final VoidCallback onEnd;
  final TextOverflow overflow;
  final bool softWrap;
  final TextStyle style;
  final TextAlign textAlign;
  final TextHeightBehavior textHeightBehavior;
  final TextWidthBasis textWidthBasis;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "maxLines": <int>,
  ///   "onEnd": <VoidCallback>,
  ///   "overflow": <TextOverflow>
  ///   "softWrap": <bool>,
  ///   "style": <TextStyle>,
  ///   "textAlign": <TextAlign>,
  ///   "textHeightBehavior": <TextHeightBehavior>,
  ///   "textWidthBasis": <TextWidthBasis>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  ///
  ///  See also:
  ///  * [ThemeDecoder.decodeTextOverflow]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [ThemeDecoder.decodeTextAlign]
  ///  * [ThemeDecoder.decodeTextHeightBehavior]
  ///  * [ThemeDecoder.decodeTextWidthBasis]
  static JsonAnimatedDefaultTextStyleBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAnimatedDefaultTextStyleBuilder result;

    if (map != null) {
      result = JsonAnimatedDefaultTextStyleBuilder(
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        ),
        maxLines: JsonClass.parseInt(map['maxLines']),
        onEnd: map['onEnd'],
        overflow: ThemeDecoder.decodeTextOverflow(
              map['overflow'],
              validate: false,
            ) ??
            TextOverflow.clip,
        softWrap: map['software'] == null
            ? true
            : JsonClass.parseBool(map['softWrap']),
        style: ThemeDecoder.decodeTextStyle(
          map['style'],
          validate: false,
        ),
        textAlign: ThemeDecoder.decodeTextAlign(
          map['textAlign'],
          validate: false,
        ),
        textHeightBehavior: ThemeDecoder.decodeTextHeightBehavior(
          map['textHeightBehavior'],
          validate: false,
        ),
        textWidthBasis: ThemeDecoder.decodeTextWidthBasis(
              map['textWidthBasis'],
              validate: false,
            ) ??
            TextWidthBasis.parent,
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
      '[JsonAnimatedDefaultTextStyleBuilder] only supports exactly one child.',
    );

    return _JsonAnimatedDefaultTextStyle(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonAnimatedDefaultTextStyle extends StatefulWidget {
  _JsonAnimatedDefaultTextStyle({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonAnimatedDefaultTextStyleBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedDefaultTextStyleState createState() =>
      _JsonAnimatedDefaultTextStyleState();
}

class _JsonAnimatedDefaultTextStyleState
    extends State<_JsonAnimatedDefaultTextStyle> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: widget.builder.curve,
      duration: widget.builder.duration,
      maxLines: widget.builder.maxLines,
      onEnd: widget.builder.onEnd,
      overflow: widget.builder.overflow,
      softWrap: widget.builder.softWrap,
      style: widget.builder.style,
      textAlign: widget.builder.textAlign,
      textHeightBehavior: widget.builder.textHeightBehavior,
      textWidthBasis: widget.builder.textWidthBasis,
      child: widget.data.children[0].build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
