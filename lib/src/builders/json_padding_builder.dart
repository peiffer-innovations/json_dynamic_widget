import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Padding] widget.  See the [fromDynamic] for the
/// format.
class JsonPaddingBuilder extends JsonWidgetBuilder {
  const JsonPaddingBuilder({
    required this.padding,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'padding';

  final EdgeInsets padding;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "padding": "<EdgeInsetsGeometry>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static JsonPaddingBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonPaddingBuilder? result;

    if (map != null) {
      result = JsonPaddingBuilder(
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ) as EdgeInsets,
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

    return Padding(
      key: key,
      padding: padding,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
