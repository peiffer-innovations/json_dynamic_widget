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
    String? text,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  })  : text = text ?? '',
        super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'text';

  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final String text;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

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
  static JsonTextBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonTextBuilder? result;
    if (map != null) {
      result = JsonTextBuilder(
        locale: ThemeDecoder.decodeLocale(
          map['local'],
          validate: false,
        ),
        maxLines: JsonClass.parseInt(map['maxLines']),
        overflow: ThemeDecoder.decodeTextOverflow(
          map['overflow'],
          validate: false,
        ),
        semanticsLabel: map['semanticsLabel'],
        softWrap: map['softWrap'] == null
            ? null
            : JsonClass.parseBool(map['softWrap']),
        strutStyle: ThemeDecoder.decodeStrutStyle(
          map['strutStyle'],
          validate: false,
        ),
        style: ThemeDecoder.decodeTextStyle(
          map['style'],
          validate: false,
        ),
        text: map['text'].toString(),
        textAlign: ThemeDecoder.decodeTextAlign(
          map['textAlign'],
          validate: false,
        ),
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        ),
        textHeightBehavior: ThemeDecoder.decodeTextHeightBehavior(
          map['textHeightBehavior'],
          validate: false,
        ),
        textScaleFactor: JsonClass.parseDouble(map['textScaleFactor']),
        textWidthBasis: ThemeDecoder.decodeTextWidthBasis(
          map['textWidthBasis'],
          validate: false,
        ),
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
  }) =>
      Text(
        text,
        key: key,
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
