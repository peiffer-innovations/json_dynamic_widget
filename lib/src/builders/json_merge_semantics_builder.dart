import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [MergeSemantics] widget.  See the [fromDynamic]
/// for the format.
class JsonMergeSemanticsBuilder extends JsonWidgetBuilder {
  JsonMergeSemanticsBuilder()
      : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'merge_semantics';

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  /// }
  /// ```
  static JsonMergeSemanticsBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonMergeSemanticsBuilder? result;

    if (map != null) {
      result = JsonMergeSemanticsBuilder();
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

    return MergeSemantics(
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
