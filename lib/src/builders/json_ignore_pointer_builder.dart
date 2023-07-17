import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [IgnorePointer] widget.  See the [fromDynamic] for
/// the format.
class JsonIgnorePointerBuilder extends JsonWidgetBuilder {
  const JsonIgnorePointerBuilder({
    required this.ignoring,
    this.ignoringSemantics,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'ignore_pointer';

  final bool ignoring;
  final bool? ignoringSemantics;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "ignoring": "<bool>",
  ///   "ignoringSemantics": "<bool>"
  /// }
  /// ```
  static JsonIgnorePointerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIgnorePointerBuilder? result;

    if (map != null) {
      result = JsonIgnorePointerBuilder(
        ignoring: JsonClass.parseBool(
          map['ignoring'],
          whenNull: true,
        ),
        ignoringSemantics: JsonClass.maybeParseBool(map['ignoringSemantics']),
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

    return IgnorePointer(
      ignoring: ignoring,
      ignoringSemantics: ignoringSemantics,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
