import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [SafeArea] widget.  See the [fromDynamic] for the
/// format.
class JsonSafeAreaBuilder extends JsonWidgetBuilder {
  JsonSafeAreaBuilder({
    this.bottom,
    this.left,
    this.maintainBottomViewPadding,
    this.minimum,
    this.right,
    this.top,
  });

  static const type = 'safe_area';

  final bool bottom;
  final bool left;
  final bool maintainBottomViewPadding;
  final EdgeInsets minimum;
  final bool right;
  final bool top;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "bottom": <bool>,
  ///   "left": <bool>,
  ///   "maintainBottomViewPadding": <bool>,
  ///   "minimum": <EdgeInsetsGeometry>,
  ///   "right": <bool>,
  ///   "top": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static JsonSafeAreaBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonSafeAreaBuilder result;

    if (map != null) {
      result = JsonSafeAreaBuilder(
        bottom: map['bottom'] == null
            ? true
            : JsonClass.parseBool(
                map['bottom'],
              ),
        left: map['left'] == null ? true : JsonClass.parseBool(map['left']),
        maintainBottomViewPadding: JsonClass.parseBool(
          map['maintainBottomViewPadding'],
        ),
        minimum: ThemeDecoder.decodeEdgeInsetsGeometry(map['minimum']) ??
            EdgeInsets.zero,
        right: map['right'] == null ? true : JsonClass.parseBool(map['right']),
        top: map['top'] == null ? true : JsonClass.parseBool(map['top']),
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
      '[JsonSafeAreaBuilder] only supports exactly one child.',
    );

    return SafeArea(
      bottom: bottom,
      left: left,
      maintainBottomViewPadding: maintainBottomViewPadding,
      minimum: minimum,
      right: right,
      top: top,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
