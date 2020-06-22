import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Container] widget.  See the [fromDynamic] for the
/// format.
class JsonContainerBuilder extends JsonWidgetBuilder {
  JsonContainerBuilder({
    this.alignment,
    this.clipBehavior,
    this.color,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.height,
    this.margin,
    this.padding,
    this.transform,
    this.width,
  });

  static const type = 'container';

  final Alignment alignment;
  final Clip clipBehavior;
  final Color color;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final BoxDecoration foregroundDecoration;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Matrix4 transform;
  final double width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "clipBehavior": <Clip>,
  ///   "color": <Color>,
  ///   "constraints": <BoxConstraints>,
  ///   "decoration": <BoxDecoration>,
  ///   "foregroundDecoration": <BoxDecoration>
  ///   "height": <double>,
  ///   "margin": <EdgeInsetsGeometry>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "transform": <Matrix4>,
  ///   "width": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeBoxConstraints]
  ///  * [ThemeDecoder.decodeBoxDirection]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeMatrix4]
  static JsonContainerBuilder fromDynamic(dynamic map) {
    JsonContainerBuilder result;
    if (map != null) {
      result = JsonContainerBuilder(
        alignment: ThemeDecoder.decodeAlignment(map['alignment']),
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
        color: ThemeDecoder.decodeColor(map['color']),
        constraints: ThemeDecoder.decodeBoxConstraints(map['constraints']),
        decoration: ThemeDecoder.decodeBoxDecoration(map['decoration']),
        foregroundDecoration: ThemeDecoder.decodeBoxDecoration(
          map['foregroundDecoration'],
        ),
        height: JsonClass.parseDouble(map['height']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(map['margin']),
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']),
        transform: ThemeDecoder.decodeMatrix4(map['matrix4']),
        width: JsonClass.parseDouble(map['width']),
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
      '[JsonContainerBuilder] only supports exactly one child.',
    );

    return Container(
      alignment: alignment,
      clipBehavior: clipBehavior,
      color: color,
      constraints: constraints,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      height: height,
      margin: margin,
      padding: padding,
      transform: transform,
      width: width,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
