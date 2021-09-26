import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [CircularProgressIndicator] widget.  See the
/// [fromDynamic] for the format.
class JsonCircularProgressIndicatorBuilder extends JsonWidgetBuilder {
  JsonCircularProgressIndicatorBuilder({
    this.backgroundColor,
    this.color,
    this.semanticsLabel,
    this.semanticsValue,
    required this.strokeWidth,
    this.value,
    this.valueColor,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;

  static const type = 'circular_progress_indicator';

  final Color? backgroundColor;
  final Color? color;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "color": <Color>,
  ///   "semanticsLabel": <String>,
  ///   "semanticsValue": <String>,
  ///   "strokeWidth": <double>,
  ///   "value": <double>,
  ///   "valueColor": <Animation<Color> | Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextBaseline]
  static JsonCircularProgressIndicatorBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonCircularProgressIndicatorBuilder? result;

    if (map != null) {
      result = JsonCircularProgressIndicatorBuilder(
        backgroundColor: ThemeDecoder.decodeColor(map['backgroundColor']),
        color: ThemeDecoder.decodeColor(map['color']),
        semanticsLabel: map['semanticsLabel'],
        semanticsValue: map['semanticsValue'],
        strokeWidth: JsonClass.parseDouble(map['strokeWidth'], 4.0)!,
        value: JsonClass.parseDouble(map['value']),
        valueColor: map['valueColor'] == null
            ? null
            : map['valueColor'] is Animation
                ? map['valueColor']
                : AlwaysStoppedAnimation(
                    ThemeDecoder.decodeColor(map['valueColor'])!,
                  ),
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
    return CircularProgressIndicator(
      backgroundColor: backgroundColor,
      color: color,
      key: key,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      value: value,
      valueColor: valueColor,
    );
  }
}
