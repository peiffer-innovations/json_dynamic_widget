import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [MergeSemantics] widget.  See the [fromDynamic]
/// for the format.
class JsonExcludeSemanticsBuilder extends JsonWidgetBuilder {
  const JsonExcludeSemanticsBuilder({
    required this.excluding,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'exclude_semantics';

  final bool excluding;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "excluding": "<bool>"
  /// }
  /// ```
  static JsonExcludeSemanticsBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonExcludeSemanticsBuilder? result;

    if (map != null) {
      result = JsonExcludeSemanticsBuilder(
        excluding: JsonClass.parseBool(
          map['excluding'],
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

    return ExcludeSemantics(
      excluding: excluding,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
