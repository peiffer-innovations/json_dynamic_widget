import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ClipRect] widget.  See the [fromDynamic] for the
/// format.
class JsonClipRectBuilder extends JsonWidgetBuilder {
  JsonClipRectBuilder({
    this.clipBehavior,
  });

  static const type = 'clip_rect';

  final Clip clipBehavior;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "clip": <Clip>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeClip]
  static JsonClipRectBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonClipRectBuilder result;

    if (map != null) {
      result = JsonClipRectBuilder(
        clipBehavior:
            ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
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
      '[JsonClipRectBuilder] only supports exactly one child.',
    );

    return ClipRect(
      clipBehavior: clipBehavior,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
