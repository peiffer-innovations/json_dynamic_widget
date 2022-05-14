import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Card] widget.  See the [fromDynamic] for the
/// format.
class JsonCardBuilder extends JsonWidgetBuilder {
  JsonCardBuilder({
    required this.borderOnForeground,
    this.clipBehavior,
    this.color,
    this.elevation,
    this.margin,
    required this.semanticContainer,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;

  static const type = 'card';

  final bool borderOnForeground;
  final Clip? clipBehavior;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "borderOnForeground": <bool>,
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "elevation": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "semanticContainer": <bool>,
  ///   "shadowColor": <Color>,
  ///   "shape": <ShapeBorder>,
  ///   "surfaceTintColor": <Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeShapeBorder]
  static JsonCardBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonCardBuilder? result;
    if (map != null) {
      result = JsonCardBuilder(
        borderOnForeground: map['borderOnForeground'] == null
            ? true
            : JsonClass.parseBool(
                map['borderOnForeground'],
              ),
        clipBehavior: ThemeDecoder.decodeClip(
          map['clipBehavior'],
          validate: false,
        ),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        elevation: JsonClass.parseDouble(map['elevation']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['margin'],
          validate: false,
        ),
        semanticContainer: map['semanticContainer'] == null
            ? true
            : JsonClass.parseBool(
                map['semanticContainer'],
              ),
        shadowColor: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        shape: ThemeDecoder.decodeShapeBorder(
          map['shape'],
          validate: false,
        ),
        surfaceTintColor: ThemeDecoder.decodeColor(
          map['color'],
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
    var child = getChild(data);

    return Card(
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      key: key,
      margin: margin,
      semanticContainer: semanticContainer,
      shadowColor: shadowColor,
      shape: shape,
      surfaceTintColor: surfaceTintColor,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
