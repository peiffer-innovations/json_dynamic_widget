import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Icon] widget.  See the [fromDynamic] for the
/// format.
class JsonIconBuilder extends JsonWidgetBuilder {
  JsonIconBuilder({
    this.color,
    this.fill,
    this.grade,
    required this.icon,
    this.opticalSize,
    this.semanticLabel,
    this.shadows,
    this.size,
    this.textDirection,
    this.weight,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'icon';

  final Color? color;
  final double? fill;
  final double? grade;
  final IconData? icon;
  final double? opticalSize;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final double? size;
  final TextDirection? textDirection;
  final double? weight;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fill": "<double>",
  ///   "grade": "<double>",
  ///   "icon": "<IconData>",
  ///   "opticalSize": "<double>",
  ///   "semanticLabel": "<String>",
  ///   "shadows": "<List<Shadow>>",
  ///   "size": "<double>",
  ///   "textDirection": "<TextDirection>",
  ///   "weight": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeIconData]
  ///  * [ThemeDecoder.decodeShadow]
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonIconBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIconBuilder? result;

    if (map != null) {
      result = JsonIconBuilder(
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        fill: JsonClass.parseDouble(map['fill']),
        grade: JsonClass.parseDouble(map['grade']),
        icon: ThemeDecoder.decodeIconData(
          map['icon'],
          validate: false,
        ),
        opticalSize: JsonClass.parseDouble(map['opticalSize']),
        semanticLabel: map['semanticLabel'],
        shadows: JsonClass.fromDynamicList(
          map['shadows'],
          (map) => ThemeDecoder.decodeShadow(
            map,
            validate: false,
          )!,
        ),
        size: JsonClass.parseDouble(map['size']),
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
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
  }) {
    return Icon(
      icon,
      color: color,
      fill: fill,
      grade: grade,
      key: key,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      shadows: shadows,
      size: size,
      textDirection: textDirection,
      weight: weight,
    );
  }
}
