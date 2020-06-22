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
    @required this.icon,
    this.semanticLabel,
    this.size,
    this.textDirection,
  });

  static const type = 'icon';

  final Color color;
  final IconData icon;
  final String semanticLabel;
  final double size;
  final TextDirection textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "icon": <IconData>,
  ///   "semanticLabel": <String>,
  ///   "size": <double>,
  ///   "textDirection": <TextDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeIconData]
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonIconBuilder fromDynamic(dynamic map) {
    JsonIconBuilder result;

    if (map != null) {
      result = JsonIconBuilder(
        color: ThemeDecoder.decodeColor(map['color']),
        icon: ThemeDecoder.decodeIconData(map['icon']),
        semanticLabel: map['semanticLabel'],
        size: JsonClass.parseDouble(map['size']),
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[JsonIconBuilder] does not support children.',
    );

    return Icon(
      icon,
      color: color,
      semanticLabel: semanticLabel,
      size: size,
      textDirection: textDirection,
    );
  }
}
