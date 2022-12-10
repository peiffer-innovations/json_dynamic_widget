import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [LayoutBuilder] widget.  See the [fromDynamic] for the
/// format.
class JsonLayoutBuilderBuilder extends JsonWidgetBuilder {
  JsonLayoutBuilderBuilder()
      : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'layout_builder';

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  /// }
  /// ```
  static JsonLayoutBuilderBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonLayoutBuilderBuilder? result;
    if (map != null) {
      result = JsonLayoutBuilderBuilder();
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
    return LayoutBuilder(
        key: key,
        builder: (BuildContext context, BoxConstraints constraints) {
          var id = data.id;

          data.registry.setValue(
            '$id.maxHeight',
            constraints.maxHeight,
            originator: '$id.maxHeight',
          );
          data.registry.setValue(
            '$id.maxWidth',
            constraints.maxWidth,
            originator: '$id.maxWidth',
          );
          data.registry.setValue(
            '$id.minHeight',
            constraints.minHeight,
            originator: '$id.minHeight',
          );
          data.registry.setValue(
            '$id.minWidth',
            constraints.minWidth,
            originator: '$id.minWidth',
          );

          var child = getChild(data);

          return data.children?.length != 1
              ? SizedBox()
              : child.build(
                  childBuilder: childBuilder,
                  context: context,
                );
        });
  }
}
