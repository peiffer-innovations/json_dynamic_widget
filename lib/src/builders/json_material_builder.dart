import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Material] widget.  See the [fromDynamic] for the
/// format.
class JsonMaterialBuilder extends JsonWidgetBuilder {
  JsonMaterialBuilder({
    required this.animationDuration,
    required this.borderOnForeground,
    this.borderRadius,
    required this.clipBehavior,
    this.color,
    required this.elevation,
    this.margin,
    required this.materialType,
    this.padding,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.textStyle,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'material';

  final Duration animationDuration;
  final bool borderOnForeground;
  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final Color? color;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final MaterialType materialType;
  final EdgeInsetsGeometry? padding;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final TextStyle? textStyle;

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
  ///   "surfaceTintColor": <Color>,
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
  static JsonMaterialBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonMaterialBuilder? result;
    if (map != null) {
      result = JsonMaterialBuilder(
        animationDuration: JsonClass.parseDurationFromMillis(
            map['animationDuration'], kThemeChangeDuration)!,
        borderOnForeground: map['borderOnForeground'] == null
            ? true
            : JsonClass.parseBool(
                map['borderOnForeground'],
              ),
        borderRadius: ThemeDecoder.decodeBorderRadius(
          map['borderRadius'],
          validate: false,
        ),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.none,
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        elevation: JsonClass.parseDouble(map['elevation'], 0)!,
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['margin'],
          validate: false,
        ),
        materialType: ThemeDecoder.decodeMaterialType(
              map['type'],
              validate: false,
            ) ??
            MaterialType.canvas,
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ),
        shadowColor: ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            ) ??
            const Color(0xFF000000),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        surfaceTintColor: ThemeDecoder.decodeColor(
          map['surfaceTintColor'],
          validate: false,
        ),
        textStyle: ThemeDecoder.decodeTextStyle(
          map['textStyle'],
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
    var child = getChild(data).build(
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
      key: key,
      shadowColor: shadowColor,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      textStyle: textStyle,
      type: materialType,
      child: padding == null
          ? child
          : Padding(
              padding: padding!,
              child: child,
            ),
    );

    if (margin != null) {
      result = Padding(
        padding: margin!,
        child: result,
      );
    }

    return result;
  }
}
