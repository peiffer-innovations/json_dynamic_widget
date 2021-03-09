import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Center] widget.  See the [fromDynamic] for the
/// format.
class JsonCenterBuilder extends JsonWidgetBuilder {
  JsonCenterBuilder({
    this.heightFactor,
    this.widthFactor,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;

  static const type = 'center';

  final double? heightFactor;
  final double? widthFactor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "heightFactor": <double>,
  ///   "widthFactor": <double>
  /// }
  /// ```
  static JsonCenterBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonCenterBuilder? result;

    if (map != null) {
      result = JsonCenterBuilder(
        heightFactor: JsonClass.parseDouble(map['heightFactor']),
        widthFactor: JsonClass.parseDouble(map['widthFactor']),
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

    return Center(
      heightFactor: heightFactor,
      key: key,
      widthFactor: widthFactor,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
