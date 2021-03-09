import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IntrinsicHeight] widget.  See the [fromDynamic] for the
/// format.
class JsonIntrinsicHeightBuilder extends JsonWidgetBuilder {
  JsonIntrinsicHeightBuilder()
      : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'intrinsic_height';

  /// Builds the builder from a Map-like dynamic structure.  This expects an
  /// empty JSON.
  static JsonIntrinsicHeightBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIntrinsicHeightBuilder? result;

    if (map != null) {
      result = JsonIntrinsicHeightBuilder();
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

    return IntrinsicHeight(
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
