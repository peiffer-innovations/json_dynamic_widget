import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [SliverPadding] widget.  See the [fromDynamic] for the
/// format.
class JsonSliverPaddingBuilder extends JsonWidgetBuilder {
  const JsonSliverPaddingBuilder({
    required this.padding,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'sliver_padding';

  final EdgeInsets? padding;

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
  static JsonSliverPaddingBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSliverPaddingBuilder? result;

    if (map != null) {
      result = JsonSliverPaddingBuilder(
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ) as EdgeInsets?,
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

    return SliverPadding(
      key: key,
      padding: padding ?? EdgeInsets.zero,
      sliver: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
