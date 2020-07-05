import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Material] widget.  See the [fromDynamic] for the
/// format.
class JsonMaterialBuilder extends JsonWidgetBuilder {
  JsonMaterialBuilder({
    this.animationDuration,
    this.borderOnForeground,
    this.borderRadius,
    this.clipBehavior,
    this.color,
    this.elevation,
    this.margin,
    this.materialType,
    this.padding,
    this.shadowColor,
    this.shape,
    this.textStyle,
  });

  static const type = 'material';

  final Duration animationDuration;
  final bool borderOnForeground;
  final BorderRadius borderRadius;
  final Clip clipBehavior;
  final Color color;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final MaterialType materialType;
  final EdgeInsetsGeometry padding;
  final Color shadowColor;
  final ShapeBorder shape;
  final TextStyle textStyle;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "animationDuration": <int; millis>,
  ///   "borderOnForeground": <bool>,
  ///   "borderRadius": <BorderRadius>,
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "materialType": <MaterialType>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "shadowColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "textStyle": <TextStyle>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBorderRadius]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeMaterialType]
  ///  * [ThemeDecoder.decodeShapeBorder]
  ///  * [ThemeDecoder.decodeTextStyle]
  static JsonMaterialBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonMaterialBuilder result;
    if (map != null) {
      result = JsonMaterialBuilder(
        animationDuration: JsonClass.parseDurationFromMillis(
            map['animationDuration'], kThemeChangeDuration),
        borderOnForeground: map['borderOnForeground'] == null
            ? true
            : JsonClass.parseBool(
                map['borderOnForeground'],
              ),
        borderRadius: ThemeDecoder.decodeBorderRadius(map['borderRadius']),
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
        color: ThemeDecoder.decodeColor(map['color']),
        elevation: JsonClass.parseDouble(map['elevation'], 0),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(map['margin']),
        materialType:
            ThemeDecoder.decodeMaterialType(map['type']) ?? MaterialType.canvas,
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']),
        shadowColor:
            ThemeDecoder.decodeColor(map['color']) ?? const Color(0xFF000000),
        shape: ThemeDecoder.decodeShapeBorder(map['shape']),
        textStyle: ThemeDecoder.decodeTextStyle(map['textStyle']),
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
      '[JsonMaterialBuilder] only supports exactly one child.',
    );

    var child = data.children[0].build(
      childBuilder: childBuilder,
      context: context,
    );

    Widget result = Material(
      animationDuration: animationDuration,
      borderOnForeground: borderOnForeground,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      textStyle: textStyle,
      type: materialType,
      child: padding == null
          ? child
          : Padding(
              padding: padding,
              child: child,
            ),
    );

    if (margin != null) {
      result = Padding(
        padding: margin,
        child: result,
      );
    }

    return result;
  }
}
