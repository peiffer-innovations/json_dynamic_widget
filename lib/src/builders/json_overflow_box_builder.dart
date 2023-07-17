import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [OverflowBox] widget.  See the [fromDynamic] for the
/// format.
class JsonOverflowBoxBuilder extends JsonWidgetBuilder {
  const JsonOverflowBoxBuilder({
    required this.alignment,
    this.maxHeight,
    this.maxWidth,
    this.minHeight,
    this.minWidth,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'overflow_box';

  final AlignmentGeometry alignment;
  final double? maxHeight;
  final double? maxWidth;
  final double? minHeight;
  final double? minWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": "<AlignmentGeometry>",
  ///   "maxHeight": "<double>",
  ///   "maxWidth": "<double>",
  ///   "minHeight": "<double>",
  ///   "minWidth": "<double>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  static JsonOverflowBoxBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonOverflowBoxBuilder? result;

    if (map != null) {
      result = JsonOverflowBoxBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        maxHeight: JsonClass.maybeParseDouble(
          map['maxHeight'],
        ),
        maxWidth: JsonClass.maybeParseDouble(
          map['maxWidth'],
        ),
        minHeight: JsonClass.maybeParseDouble(
          map['minHeight'],
        ),
        minWidth: JsonClass.maybeParseDouble(
          map['minWidth'],
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

    return OverflowBox(
      alignment: alignment,
      key: key,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      minHeight: minHeight,
      minWidth: minWidth,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
