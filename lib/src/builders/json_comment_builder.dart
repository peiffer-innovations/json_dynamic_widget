import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder is just a placeholder to allow for placing comments in the JSON
/// tree for human readability
class JsonCommentBuilder extends JsonWidgetBuilder {
  JsonCommentBuilder() : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'comment';

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "...": <...>
  /// }
  /// ```
  static JsonCommentBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonCommentBuilder? result;
    if (map != null) {
      result = JsonCommentBuilder();
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

    return child.build(
      childBuilder: childBuilder,
      context: context,
    );
  }
}
