import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [FittedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonFittedBoxBuilder extends JsonWidgetBuilder {
  JsonFittedBoxBuilder({
    required this.alignment,
    required this.clipBehavior,
    required this.fit,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'fitted_box';

  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final BoxFit fit;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "clipBehavior": <Clip>,
  ///   "fit": <BoxFit>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeBoxFit]
  static JsonFittedBoxBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonFittedBoxBuilder? result;

    if (map != null) {
      result = JsonFittedBoxBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
        fit: ThemeDecoder.decodeBoxFit(
              map['fit'],
              validate: false,
            ) ??
            BoxFit.contain,
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
    var child = getChild(data);

    return FittedBox(
      alignment: alignment,
      clipBehavior: clipBehavior,
      fit: fit,
      key: key,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
