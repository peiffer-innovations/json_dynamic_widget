import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Text] widget.  See the [fromDynamic] for the
/// format.
class JsonTextBuilder extends JsonWidgetBuilder {
  JsonTextBuilder({
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    @required this.text,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : assert(text != null);

  static const type = 'text';

  final Locale locale;
  final int maxLines;
  final TextOverflow overflow;
  final String semanticsLabel;
  final bool softWrap;
  final StrutStyle strutStyle;
  final TextStyle style;
  final String text;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final TextHeightBehavior textHeightBehavior;
  final double textScaleFactor;
  final TextWidthBasis textWidthBasis;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "locale": <Locale>,
  ///   "maxLines": <int>,
  ///   "overflow": <TextOverflow>,
  ///   "semanticsLabel": <String>,
  ///   "softWrap": <bool>,
  ///   "strutStyle": <StrutStyle>,
  ///   "style": <TextStyle>,
  ///   "text": <String>,
  ///   "textAlign": <TextAlign>,
  ///   "textDirection": <TextDirection>,
  ///   "textHeightBehavior": <TextHeightBehavior>,
  ///   "textScaleFactor": <double>,
  ///   "textWidthBasis": <TextWidthBasis>,
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeLocale]
  ///  * [ThemeDecoder.decodeTextOverflow]
  ///  * [ThemeDecoder.decodeStrutStyle]
  ///  * [ThemeDecoder.decodeTextAlign]
  ///  * [ThemeDecoder.decodeTextDirection]
  ///  * [ThemeDecoder.decodeTextHeightBehavior]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [ThemeDecoder.decodeTextWidthBasis]
  static JsonTextBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonTextBuilder result;
    if (map != null) {
      result = JsonTextBuilder(
        locale: ThemeDecoder.decodeLocale(map['local']),
        maxLines: JsonClass.parseInt(map['maxLines']),
        overflow: ThemeDecoder.decodeTextOverflow(map['overflow']),
        semanticsLabel: map['semanticsLabel'],
        softWrap: map['softWrap'] == null
            ? null
            : JsonClass.parseBool(map['softWrap']),
        strutStyle: ThemeDecoder.decodeStrutStyle(map['strutStyle']),
        style: ThemeDecoder.decodeTextStyle(map['style']),
        text: map['text'],
        textAlign: ThemeDecoder.decodeTextAlign(map['textAlign']),
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
        textHeightBehavior: ThemeDecoder.decodeTextHeightBehavior(
          map['textHeightBehavior'],
        ),
        textScaleFactor: JsonClass.parseDouble(map['textScaleFactor']),
        textWidthBasis: ThemeDecoder.decodeTextWidthBasis(
          map['textWidthBasis'],
        ),
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
      data.children?.isNotEmpty != true,
      '[JsonTextBuilder] does not support children.',
    );

    return Text(
      text,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
