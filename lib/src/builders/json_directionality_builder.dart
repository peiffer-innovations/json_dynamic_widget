import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build a [Directionality] widget.  See the [fromDynamic] for the
/// format.
class JsonDirectionalityBuilder extends JsonWidgetBuilder {
  const JsonDirectionalityBuilder({
    required this.textDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'directionality';

  final TextDirection textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "textDirection": "<TextDirection>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonDirectionalityBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonDirectionalityBuilder? result;

    if (map != null) {
      result = JsonDirectionalityBuilder(
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        )!,
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

    return Directionality(
      key: key,
      textDirection: textDirection,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
