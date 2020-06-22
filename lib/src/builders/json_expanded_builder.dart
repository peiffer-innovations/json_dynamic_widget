import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Expanded] widget.  See the [fromDynamic] for the
/// format.
class JsonExpandedBuilder extends JsonWidgetBuilder {
  JsonExpandedBuilder({
    this.flex,
  });

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
  static JsonExpandedBuilder fromDynamic(dynamic map) {
    JsonExpandedBuilder result;

    if (map != null) {
      result = JsonExpandedBuilder(
        flex: JsonClass.parseInt(map['flex']),
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
      '[JsonExpandedBuilder] only supports exactly one child.',
    );

    return Expanded(
      flex: flex,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
