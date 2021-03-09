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
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'sized_box';

  final double? height;
  final double? width;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "height": <double>,
  ///   "width": <double>
  /// }
  /// ```
  static JsonSizedBoxBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSizedBoxBuilder? result;
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
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return SizedBox(
      height: height,
      key: key,
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
