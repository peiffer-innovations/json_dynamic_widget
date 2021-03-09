import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Baseline] widget.  See the [fromDynamic] for the
/// format.
class JsonBaselineBuilder extends JsonWidgetBuilder {
  JsonBaselineBuilder({
    required this.baseline,
    required this.baselineType,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;

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
  static JsonBaselineBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonBaselineBuilder? result;

    if (map != null) {
      result = JsonBaselineBuilder(
        baseline: JsonClass.parseDouble(map['baseline'], 0)!,
        baselineType: ThemeDecoder.decodeTextBaseline(
              map['baselineType'],
              validate: false,
            ) ??
            TextBaseline.alphabetic,
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

    return Baseline(
      baseline: baseline,
      baselineType: baselineType,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
