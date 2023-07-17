import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build a [Placeholder] widget.  See the [fromDynamic] for the
/// format.
class JsonPlaceholderBuilder extends JsonWidgetBuilder {
  const JsonPlaceholderBuilder({
    required this.color,
    required this.fallbackHeight,
    required this.fallbackWidth,
    required this.strokeWidth,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'placeholder';

  final Color color;
  final double fallbackHeight;
  final double fallbackWidth;
  final double strokeWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "color": "<Color>",
  ///   "fallbackHeight": "<double>",
  ///   "fallbackWidth": "<double>",
  ///   "strokeWidth": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  static JsonPlaceholderBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonPlaceholderBuilder? result;

    if (map != null) {
      result = JsonPlaceholderBuilder(
        color: ThemeDecoder.decodeColor(
              map['color'],
              validate: false,
            ) ??
            const Color(0xFF455A64),
        fallbackHeight:
            JsonClass.maybeParseDouble(map['fallbackHeight']) ?? 400.0,
        fallbackWidth:
            JsonClass.maybeParseDouble(map['fallbackWidth']) ?? 400.0,
        strokeWidth: JsonClass.maybeParseDouble(map['strokeWidth']) ?? 2.0,
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
    return Placeholder(
      color: color,
      fallbackHeight: fallbackHeight,
      fallbackWidth: fallbackWidth,
      key: key,
      strokeWidth: strokeWidth,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
