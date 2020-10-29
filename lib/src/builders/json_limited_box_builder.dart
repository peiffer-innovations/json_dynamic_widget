import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build a [LimitedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonLimitedBoxBuilder extends JsonWidgetBuilder {
  JsonLimitedBoxBuilder({
    this.maxHeight,
    this.maxWidth,
  });

  static const type = 'limited_box';

  final double maxHeight;
  final double maxWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "maxHeight": <double>,
  ///   "maxWidth": <double>
  /// }
  /// ```
  static JsonLimitedBoxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonLimitedBoxBuilder result;

    if (map != null) {
      result = JsonLimitedBoxBuilder(
        maxHeight: JsonClass.parseDouble(
              map['maxHeight'],
            ) ??
            double.infinity,
        maxWidth: JsonClass.parseDouble(
              map['maxWidth'],
            ) ??
            double.infinity,
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
      '[JsonLimitedBoxBuilder] only supports exactly one child.',
    );

    return LimitedBox(
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
