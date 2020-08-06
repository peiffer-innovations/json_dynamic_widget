import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [LinearProgressIndicator] widget.  See the
/// [fromDynamic] for the format.
class JsonLinearProgressIndicatorBuilder extends JsonWidgetBuilder {
  JsonLinearProgressIndicatorBuilder({
    this.backgroundColor,
    this.minHeight,
    this.semanticsLabel,
    this.semanticsValue,
    this.value,
    this.valueColor,
  });

  static const type = 'linear_progress_indicator';

  final Color backgroundColor;
  final double minHeight;
  final String semanticsLabel;
  final String semanticsValue;
  final double value;
  final Animation<Color> valueColor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "minHeight": <double>,
  ///   "semanticsLabel": <String>,
  ///   "semanticsValue": <String>,
  ///   "value": <double>,
  ///   "valueColor": <Animation<Color> | Color>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextBaseline]
  static JsonLinearProgressIndicatorBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonLinearProgressIndicatorBuilder result;

    if (map != null) {
      result = JsonLinearProgressIndicatorBuilder(
        backgroundColor: ThemeDecoder.decodeColor(
          map['backgroundColor'],
          validate: false,
        ),
        minHeight: JsonClass.parseDouble(map['minHeight']),
        semanticsLabel: map['semanticsLabel'],
        semanticsValue: map['semanticsValue'],
        value: JsonClass.parseDouble(map['value']),
        valueColor: map['valueColor'] is Function
            ? map['valueColor']
            : AlwaysStoppedAnimation(
                ThemeDecoder.decodeColor(
                  map['valueColor'],
                  validate: false,
                ),
              ),
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
      data.children?.isNotEmpty != true,
      '[JsonLinearProgressIndicatorBuilder] does not support children.',
    );

    return LinearProgressIndicator(
      backgroundColor: backgroundColor,
      minHeight: minHeight,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      value: value,
      valueColor: valueColor,
    );
  }
}
