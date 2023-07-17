import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [RichText] widget.  See the [fromDynamic] for the
/// format.
class JsonRichTextBuilder extends JsonWidgetBuilder {
  const JsonRichTextBuilder({
    this.locale,
    this.maxLines,
    required this.overflow,
    this.selectionColor,
    this.selectionRegistrar,
    this.semanticsLabel,
    required this.softWrap,
    this.strutStyle,
    required this.text,
    required this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    required this.textScaleFactor,
    required this.textWidthBasis,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'rich_text';

  final Locale? locale;
  final int? maxLines;
  final TextOverflow overflow;
  final Color? selectionColor;
  final SelectionRegistrar? selectionRegistrar;
  final String? semanticsLabel;
  final bool softWrap;
  final StrutStyle? strutStyle;
  final TextSpan text;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double textScaleFactor;
  final TextWidthBasis textWidthBasis;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "locale": "<Locale>",
  ///   "maxLines": "<int>",
  ///   "overflow": "<TextOverflow>",
  ///   "selectionColor": "<Color>",
  ///   "selectionRegistrar": "<SelectionRegistrar>",
  ///   "semanticsLabel": "<String>",
  ///   "softWrap": "<bool>",
  ///   "strutStyle": "<StrutStyle>",
  ///   "style": "<TextStyle>",
  ///   "text": "<TextSpan>",
  ///   "textAlign": "<TextAlign>",
  ///   "textDirection": "<TextDirection>",
  ///   "textHeightBehavior": "<TextHeightBehavior>",
  ///   "textScaleFactor": "<double>",
  ///   "textWidthBasis": "<TextWidthBasis>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeLocale]
  ///  * [ThemeDecoder.decodeTextOverflow]
  ///  * [ThemeDecoder.decodeStrutStyle]
  ///  * [ThemeDecoder.decodeTextAlign]
  ///  * [ThemeDecoder.decodeTextDirection]
  ///  * [ThemeDecoder.decodeTextHeightBehavior]
  ///  * [ThemeDecoder.decodeTextSpan]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [ThemeDecoder.decodeTextWidthBasis]
  static JsonRichTextBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonRichTextBuilder? result;
    if (map != null) {
      result = JsonRichTextBuilder(
        locale: ThemeDecoder.decodeLocale(
          map['local'],
          validate: false,
        ),
        maxLines: JsonClass.maybeParseInt(map['maxLines']),
        overflow: ThemeDecoder.decodeTextOverflow(
              map['overflow'],
              validate: false,
            ) ??
            TextOverflow.clip,
        selectionColor: ThemeDecoder.decodeColor(
          map['selectionColor'],
          validate: false,
        ),
        selectionRegistrar: map['selectionRegistrar'],
        semanticsLabel: map['semanticsLabel'],
        softWrap: JsonClass.parseBool(
          map['softWrap'],
          whenNull: true,
        ),
        strutStyle: ThemeDecoder.decodeStrutStyle(
          map['strutStyle'],
          validate: false,
        ),
        text: ThemeDecoder.decodeTextSpan(
          map['text'],
          validate: false,
        )!,
        textAlign: ThemeDecoder.decodeTextAlign(
              map['textAlign'],
              validate: false,
            ) ??
            TextAlign.start,
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        ),
        textHeightBehavior: ThemeDecoder.decodeTextHeightBehavior(
          map['textHeightBehavior'],
          validate: false,
        ),
        textScaleFactor:
            JsonClass.maybeParseDouble(map['textScaleFactor']) ?? 1.0,
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
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) =>
      RichText(
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        selectionColor: selectionColor,
        selectionRegistrar: selectionRegistrar,
        softWrap: softWrap,
        strutStyle: strutStyle,
        text: text,
        textAlign: textAlign,
        textDirection: textDirection,
        textHeightBehavior: textHeightBehavior,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
      );
}
