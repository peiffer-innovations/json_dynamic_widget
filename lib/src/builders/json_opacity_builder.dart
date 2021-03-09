import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Opacity] widget.  See the [fromDynamic] for the
/// format.
class JsonOpacityBuilder extends JsonWidgetBuilder {
  JsonOpacityBuilder({
    required this.alwaysIncludeSemantics,
    required this.opacity,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'opacity';

  final bool alwaysIncludeSemantics;
  final double opacity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alwaysIncludeSemantics": <bool>,
  ///   "opacity": <double>
  /// }
  /// ```
  static JsonOpacityBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonOpacityBuilder? result;

    if (map != null) {
      result = JsonOpacityBuilder(
        alwaysIncludeSemantics:
            JsonClass.parseBool(map['alwaysIncludeSemantics']),
        opacity: JsonClass.parseDouble(map['opacity'], 1.0)!,
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

    return Opacity(
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      key: key,
      opacity: opacity,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
