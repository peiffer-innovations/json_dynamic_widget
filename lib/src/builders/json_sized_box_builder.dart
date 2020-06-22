import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [SizedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonSizedBoxBuilder extends JsonWidgetBuilder {
  JsonSizedBoxBuilder({
    this.height,
    this.width,
  });

  static const type = 'sized_box';

  final double height;
  final double width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "height": <double>,
  ///   "width": <double>
  /// }
  /// ```
  static JsonSizedBoxBuilder fromDynamic(dynamic map) {
    JsonSizedBoxBuilder result;
    if (map != null) {
      result = JsonSizedBoxBuilder(
        height: JsonClass.parseDouble(map['height']),
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
      '[JsonSizedBoxBuilder] only supports exactly one child.',
    );

    return SizedBox(
      height: height,
      width: width,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
