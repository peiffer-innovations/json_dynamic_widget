import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Wrap] widget.  See the [fromDynamic] for the
/// format.
class JsonWrapBuilder extends JsonWidgetBuilder {
  JsonWrapBuilder({
    this.alignment,
    this.clipBehavior,
    this.crossAxisAlignment,
    this.direction,
    this.runAlignment,
    this.runSpacing,
    this.spacing,
    this.textDirection,
    this.verticalDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'wrap';

  final WrapAlignment? alignment;
  final Clip? clipBehavior;
  final WrapCrossAlignment? crossAxisAlignment;
  final Axis? direction;
  final WrapAlignment? runAlignment;
  final double? runSpacing;
  final double? spacing;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <WrapAlignment>,
  ///   "clipBehavior": <Clip>,
  ///   "crossAxisAlignment": <WrapCrossAlignment>,
  ///   "direction": <Axis>,
  ///   "runAlignment": <WrapAlignment>,
  ///   "runSpacing": <double>,
  ///   "spacing": <double>,
  ///   "textDirection": <TextDirection>,
  ///   "verticalDirection": <VerticalDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAxis]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeTextDirection]
  ///  * [ThemeDecoder.decodeWrapAlignment]
  ///  * [ThemeDecoder.decodeVerticalDirection]
  ///  * [ThemeDecoder.decodeWrapCrossAlignment]
  static JsonWrapBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonWrapBuilder? result;
    if (map != null) {
      result = JsonWrapBuilder(
        alignment: ThemeDecoder.decodeWrapAlignment(map['alignment']),
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']),
        crossAxisAlignment: ThemeDecoder.decodeWrapCrossAlignment(
          map['crossAxisAlignment'],
        ),
        direction: ThemeDecoder.decodeAxis(map['axis']),
        runAlignment: ThemeDecoder.decodeWrapAlignment(map['runAlignment']),
        spacing: JsonClass.parseDouble(map['spacing']),
        runSpacing: JsonClass.parseDouble(map['runSpacing']),
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
        verticalDirection: ThemeDecoder.decodeVerticalDirection(
          map['verticalDirection'],
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
  }) =>
      Wrap(
        alignment: alignment ?? WrapAlignment.start,
        clipBehavior: clipBehavior ?? Clip.none,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        direction: direction ?? Axis.horizontal,
        key: key,
        runAlignment: runAlignment ?? WrapAlignment.start,
        runSpacing: runSpacing ?? 0.0,
        spacing: spacing ?? 0.0,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        children: [
          for (var child in data.children ?? <JsonWidgetData>[])
            child.build(
              context: context,
              childBuilder: childBuilder,
            ),
        ],
      );
}
