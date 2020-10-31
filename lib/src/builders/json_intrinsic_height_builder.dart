import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IntrinsicHeight] widget.  See the [fromDynamic] for the
/// format.
class JsonIntrinsicHeightBuilder extends JsonWidgetBuilder {
  JsonIntrinsicHeightBuilder();

  static const type = 'intrinsic_height';

  /// Builds the builder from a Map-like dynamic structure.  This expects an
  /// empty JSON.
  static JsonIntrinsicHeightBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonIntrinsicHeightBuilder result;

    if (map != null) {
      result = JsonIntrinsicHeightBuilder();
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
      '[JsonIntrinsicHeightBuilder] only supports exactly one child.',
    );

    return IntrinsicHeight(
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
