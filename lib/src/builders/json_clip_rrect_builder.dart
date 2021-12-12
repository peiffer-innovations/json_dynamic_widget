import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ClipRRect] widget.  See the [fromDynamic] for the
/// format.
class JsonClipRRectBuilder extends JsonWidgetBuilder {
  JsonClipRRectBuilder({
    this.borderRadius,
    required this.clipBehavior,
    this.clipper,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'clip_rrect';

  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final CustomClipper<RRect>? clipper;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "clipBehavior": <Clip>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBorderRadius]
  ///  * [ThemeDecoder.decodeClip]
  static JsonClipRRectBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonClipRRectBuilder? result;

    if (map != null) {
      result = JsonClipRRectBuilder(
        borderRadius: ThemeDecoder.decodeBorderRadius(
              map['borderRadius'],
              validate: false,
            ) ??
            BorderRadius.zero,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.antiAlias,
        clipper: map['clipper'],
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

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      clipper: clipper,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
