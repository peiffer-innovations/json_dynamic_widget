import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Baseline] widget.  See the [fromDynamic] for the
/// format.
class JsonBaselineBuilder extends JsonWidgetBuilder {
  JsonBaselineBuilder({
    this.baseline,
    this.baselineType,
  });

  static const type = 'baseline';

  final double baseline;
  final TextBaseline baselineType;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "baseline": <double>,
  ///   "baselineType": <TextBaseline>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextBaseline]
  static JsonBaselineBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonBaselineBuilder result;

    if (map != null) {
      result = JsonBaselineBuilder(
        baseline: JsonClass.parseDouble(map['baseline']),
        baselineType: ThemeDecoder.decodeTextBaseline(map['baselineType']),
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
      '[JsonBaselineBuilder] only supports exactly one child.',
    );

    return Baseline(
      baseline: baseline,
      baselineType: baselineType,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
