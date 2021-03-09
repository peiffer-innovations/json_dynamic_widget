import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [AspectRatio] widget.  See the [fromDynamic] for
/// the format.
class JsonAspectRatioBuilder extends JsonWidgetBuilder {
  JsonAspectRatioBuilder({
    required this.aspectRatio,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'aspect_ratio';

  final double aspectRatio;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "aspectRatio": <double>
  /// }
  /// ```
  static JsonAspectRatioBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAspectRatioBuilder? result;

    if (map != null) {
      result = JsonAspectRatioBuilder(
        aspectRatio: JsonClass.parseDouble(map['aspectRatio'], 1.0)!,
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

    return AspectRatio(
      aspectRatio: aspectRatio,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
