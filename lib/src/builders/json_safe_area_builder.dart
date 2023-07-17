import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [SafeArea] widget.  See the [fromDynamic] for the
/// format.
class JsonSafeAreaBuilder extends JsonWidgetBuilder {
  const JsonSafeAreaBuilder({
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
  ///   "bottom": "<bool>",
  ///   "left": "<bool>",
  ///   "maintainBottomViewPadding": "<bool>",
  ///   "minimum": "<EdgeInsetsGeometry>",
  ///   "right": "<bool>",
  ///   "top": "<bool>"
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
        bottom: JsonClass.parseBool(
          map['bottom'],
          whenNull: true,
        ),
        left: JsonClass.parseBool(
          map['left'],
          whenNull: true,
        ),
        maintainBottomViewPadding: JsonClass.parseBool(
          map['maintainBottomViewPadding'],
        ),
        minimum: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['minimum'],
              validate: false,
            ) as EdgeInsets? ??
            EdgeInsets.zero,
        right: JsonClass.parseBool(
          map['right'],
          whenNull: true,
        ),
        top: JsonClass.parseBool(
          map['top'],
          whenNull: true,
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
    final child = getChild(data);

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
