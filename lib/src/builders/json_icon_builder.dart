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
    required this.icon,
    this.semanticLabel,
    this.shadows,
    this.size,
    this.textDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'icon';

  final Color? color;
  final IconData? icon;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final double? size;
  final TextDirection? textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "icon": <IconData>,
  ///   "semanticLabel": <String>,
  ///   "shadows": <List<Shadow>>,
  ///   "size": <double>,
  ///   "textDirection": <TextDirection>
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
        icon: ThemeDecoder.decodeIconData(
          map['icon'],
          validate: false,
        ),
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
      key: key,
      semanticLabel: semanticLabel,
      shadows: shadows,
      size: size,
      textDirection: textDirection,
    );
  }
}
