import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Positioned] widget.  See the [fromDynamic] for
/// the format.
class JsonPositionedBuilder extends JsonWidgetBuilder {
  JsonPositionedBuilder({
    this.bottom,
    this.height,
    this.left,
    this.right,
    this.top,
    this.width,
  });

  static const type = 'positioned';

  final double bottom;
  final double height;
  final double left;
  final double right;
  final double top;
  final double width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "bottom": <double>,
  ///   "height": <double>,
  ///   "left": <double>,
  ///   "right": <double>,
  ///   "top": <double>,
  ///   "width": <double>
  /// }
  /// ```
  static JsonPositionedBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonPositionedBuilder result;

    if (map != null) {
      result = JsonPositionedBuilder(
        bottom: JsonClass.parseDouble(map['bottom']),
        height: JsonClass.parseDouble(map['height']),
        left: JsonClass.parseDouble(map['left']),
        right: JsonClass.parseDouble(map['right']),
        top: JsonClass.parseDouble(map['top']),
        width: JsonClass.parseDouble(map['width']),
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
      data.children?.length == 1,
      '[JsonPositionedBuilder] only supports exactly one child.',
    );

    return Positioned(
      bottom: bottom,
      height: height,
      left: left,
      right: right,
      top: top,
      width: width,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
