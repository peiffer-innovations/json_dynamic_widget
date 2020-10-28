import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Placeholder] widget.  See the [fromDynamic] for the
/// format.
class JsonPlaceholderBuilder extends JsonWidgetBuilder {
  JsonPlaceholderBuilder({
    this.color,
    this.fallbackHeight,
    this.fallbackWidth,
    this.strokeWidth,
  });

  static const type = 'placeholder';

  final Color color;
  final double fallbackHeight;
  final double fallbackWidth;
  final double strokeWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": <Color>,
  ///   "fallbackHeight": <double>,
  ///   "fallbackWidth": <double>,
  ///   "strokeWidth": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  static JsonPlaceholderBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonPlaceholderBuilder result;

    if (map != null) {
      result = JsonPlaceholderBuilder(
        color: ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            ) ??
            Color(0xFF455A64),
        fallbackHeight: JsonClass.parseDouble(
          map['fallbackHeight'],
          400.0,
        ),
        fallbackWidth: JsonClass.parseDouble(
          map['fallbackWidth'],
          400.0,
        ),
        strokeWidth: JsonClass.parseDouble(
          map['strokeWidth'],
          2.0,
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
      data.children?.isEmpty != false,
      '[JsonPlaceholderBuilder] does not support children',
    );

    return Placeholder(
      color: color,
      fallbackHeight: fallbackHeight,
      fallbackWidth: fallbackWidth,
      strokeWidth: strokeWidth,
    );
  }
}
