import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build a [LimitedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonLimitedBoxBuilder extends JsonWidgetBuilder {
  const JsonLimitedBoxBuilder({
    required this.maxHeight,
    required this.maxWidth,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'limited_box';

  final double maxHeight;
  final double maxWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "maxHeight": "<double>",
  ///   "maxWidth": "<double>"
  /// }
  /// ```
  static JsonLimitedBoxBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonLimitedBoxBuilder? result;

    if (map != null) {
      result = JsonLimitedBoxBuilder(
        maxHeight: JsonClass.maybeParseDouble(
              map['maxHeight'],
            ) ??
            double.infinity,
        maxWidth: JsonClass.maybeParseDouble(
              map['maxWidth'],
            ) ??
            double.infinity,
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

    return LimitedBox(
      key: key,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
