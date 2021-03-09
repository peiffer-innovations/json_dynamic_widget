import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Expanded] widget.  See the [fromDynamic] for the
/// format.
class JsonExpandedBuilder extends JsonWidgetBuilder {
  JsonExpandedBuilder({
    required this.flex,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'expanded';

  final int flex;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "flex": <double>
  /// }
  /// ```
  static JsonExpandedBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonExpandedBuilder? result;

    if (map != null) {
      result = JsonExpandedBuilder(
        flex: JsonClass.parseInt(map['flex'], 1)!,
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

    return Expanded(
      flex: flex,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
