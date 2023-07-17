import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Expanded] widget.  See the [fromDynamic] for the
/// format.
class JsonExpandedBuilder extends JsonWidgetBuilder {
  const JsonExpandedBuilder({
    required this.flex,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'expanded';

  final int flex;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "flex": "<double>"
  /// }
  /// ```
  static JsonExpandedBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonExpandedBuilder? result;

    if (map != null) {
      result = JsonExpandedBuilder(
        flex: JsonClass.maybeParseInt(map['flex']) ?? 1,
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

    return Expanded(
      flex: flex,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
