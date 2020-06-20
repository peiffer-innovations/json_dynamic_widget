import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonCardBuilder extends JsonWidgetBuilder {
  JsonCardBuilder({
    this.borderOnForeground,
    this.clipBehavior,
    this.color,
    this.elevation,
    this.margin,
    this.semanticContainer,
    this.shadowColor,
    this.shape,
  });

  static const type = 'card';

  final bool borderOnForeground;
  final Clip clipBehavior;
  final Color color;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final bool semanticContainer;
  final Color shadowColor;
  final ShapeBorder shape;

  static JsonCardBuilder fromDynamic(dynamic map) {
    JsonCardBuilder result;
    if (map != null) {
      result = JsonCardBuilder(
        borderOnForeground: map['borderOnForeground'] == null
            ? null
            : JsonClass.parseBool(
                map['borderOnForeground'],
              ),
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']),
        color: ThemeDecoder.decodeColor(map['color']),
        elevation: JsonClass.parseDouble(map['elevation']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(map['margin']),
        semanticContainer: map['semanticContainer'] == null
            ? null
            : JsonClass.parseBool(
                map['semanticContainer'],
              ),
        shadowColor: ThemeDecoder.decodeColor(map['color']),
        shape: ThemeDecoder.decodeShapeBorder(map['shape']),
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
      '[JsonCardBuilder] only supports exactly one child.',
    );

    return Card(
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      margin: margin,
      semanticContainer: semanticContainer,
      shadowColor: shadowColor,
      shape: shape,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
