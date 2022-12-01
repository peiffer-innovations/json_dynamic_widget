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
    required this.clipBehavior,
    this.color,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.height,
    this.margin,
    this.padding,
    this.transform,
    this.transformAlignment,
    this.width,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'container';

  final Alignment? alignment;
  final Clip clipBehavior;
  final Color? color;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final BoxDecoration? foregroundDecoration;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final double? width;

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
  ///   "transformAlignment": <TransformAlignment>,
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
  static JsonContainerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonContainerBuilder? result;
    if (map != null) {
      result = JsonContainerBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
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
        constraints: ThemeDecoder.decodeBoxConstraints(
          map['constraints'],
          validate: false,
        ),
        decoration: ThemeDecoder.decodeBoxDecoration(
          map['decoration'],
          validate: false,
        ),
        foregroundDecoration: ThemeDecoder.decodeBoxDecoration(
          map['foregroundDecoration'],
          validate: false,
        ),
        height: JsonClass.parseDouble(map['height']),
        margin: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['margin'],
          validate: false,
        ) as EdgeInsets?,
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ) as EdgeInsets?,
        transform: ThemeDecoder.decodeMatrix4(
          map['transform'],
          validate: false,
        ),
        transformAlignment: ThemeDecoder.decodeAlignment(
          map['transformAlignment'],
          validate: false,
        ),
        width: JsonClass.parseDouble(map['width']),
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

    return Container(
      alignment: alignment,
      clipBehavior: clipBehavior,
      color: color,
      constraints: constraints,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      height: height,
      key: key,
      margin: margin,
      padding: padding,
      transform: transform,
      transformAlignment: transformAlignment,
      width: width,
      child: data.children?.length != 1
          ? null
          : child.build(
              childBuilder: childBuilder,
              context: context,
            ),
    );
  }
}
