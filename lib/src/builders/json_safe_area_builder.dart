import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [SafeArea] widget.  See the [fromDynamic] for the
/// format.
class JsonSafeAreaBuilder extends JsonWidgetBuilder {
  JsonSafeAreaBuilder({
    required this.bottom,
    required this.left,
    required this.maintainBottomViewPadding,
    required this.minimum,
    required this.right,
    required this.top,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
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
  static JsonSafeAreaBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSafeAreaBuilder? result;

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
        minimum: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['minimum'],
              validate: false,
            ) as EdgeInsets? ??
            EdgeInsets.zero,
        right: map['right'] == null ? true : JsonClass.parseBool(map['right']),
        top: map['top'] == null ? true : JsonClass.parseBool(map['top']),
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

    return SafeArea(
      bottom: bottom,
      key: key,
      left: left,
      maintainBottomViewPadding: maintainBottomViewPadding,
      minimum: minimum,
      right: right,
      top: top,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
