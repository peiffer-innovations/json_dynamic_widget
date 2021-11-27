import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Wrap] widget.  See the [fromDynamic] for the
/// format.
class JsonWrapBuilder extends JsonWidgetBuilder {
  JsonWrapBuilder({
    this.alignment,
    this.clipBehavior,
    this.crossAxisAlignment,
    this.direction,
    this.runAlignment,
    this.runSpacing,
    this.spacing,
    this.textDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'wrap';

  final WrapAlignment? alignment;
  final Clip? clipBehavior;
  final WrapCrossAlignment? crossAxisAlignment;
  final Axis? direction;
  final WrapAlignment? runAlignment;
  final double? runSpacing;
  final double? spacing;
  final TextDirection? textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <WrapAlignment>,
  ///   "clipBehavior": <Clip>,
  ///   "crossAxisAlignment": <WrapCrossAlignment>,
  ///   "direction": <Axis>,
  ///   "runAlignment": <WrapAlignment>,
  ///   "runSpacing": <double>,
  ///   "spacing": <double>,
  ///   "textDirection": <TextDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAxis]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeTextDirection]
  ///  * [ThemeDecoder.decodeWrapAlignment]
  ///  * [ThemeDecoder.decodeWrapCrossAlignment]
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
      Wrap(
        alignment: alignment ?? WrapAlignment.start,
        clipBehavior: clipBehavior ?? Clip.none,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        direction: direction ?? Axis.horizontal,
        key: key,
        runAlignment: runAlignment ?? WrapAlignment.start,
        runSpacing: runSpacing ?? 0.0,
        spacing: spacing ?? 0.0,
        textDirection: textDirection,
        children: [],
      );
}
