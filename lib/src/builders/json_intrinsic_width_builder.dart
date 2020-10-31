import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IntrinsicWidth] widget.  See the [fromDynamic] for the
/// format.
class JsonIntrinsicWidthBuilder extends JsonWidgetBuilder {
  JsonIntrinsicWidthBuilder({
    this.stepHeight,
    this.stepWidth,
  });

  static const type = 'intrinsic_width';

  final double stepHeight;
  final double stepWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "stepHeight": <double>,
  ///   "stepWidth": <double>
  /// }
  /// ```
  static JsonIntrinsicWidthBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonIntrinsicWidthBuilder result;

    if (map != null) {
      result = JsonIntrinsicWidthBuilder(
        stepHeight: JsonClass.parseDouble(
          map['stepHeight'],
        ),
        stepWidth: JsonClass.parseDouble(
          map['stepWidth'],
        ),
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
      '[JsonIntrinsicWidthBuilder] only supports exactly one child.',
    );

    return IntrinsicWidth(
      stepHeight: stepHeight,
      stepWidth: stepWidth,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
