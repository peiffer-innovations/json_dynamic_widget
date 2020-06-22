import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ClipRRect] widget.  See the [fromDynamic] for the
/// format.
class JsonClipRRectBuilder extends JsonWidgetBuilder {
  JsonClipRRectBuilder({
    this.borderRadius,
    this.clipBehavior,
  });

  static const type = 'clip_rrect';

  final BorderRadius borderRadius;
  final Clip clipBehavior;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "borderRadius": <BorderRadius>,
  ///   "clip": <Clip>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeBorderRadius]
  ///  * [ThemeDecoder.decodeClip]
  static JsonClipRRectBuilder fromDynamic(dynamic map) {
    JsonClipRRectBuilder result;

    if (map != null) {
      result = JsonClipRRectBuilder(
        borderRadius: ThemeDecoder.decodeBorderRadius(map['borderRadius']),
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']),
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
      '[JsonClipRRectBuilder] only supports exactly one child.',
    );

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
