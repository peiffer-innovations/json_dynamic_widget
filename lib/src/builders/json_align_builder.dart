import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Align] widget.  See the [fromDynamic] for the
/// format.
class JsonAlignBuilder extends JsonWidgetBuilder {
  JsonAlignBuilder({
    this.alignment,
    this.heightFactor,
    this.widthFactor,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'align';

  final AlignmentGeometry? alignment;
  final double? heightFactor;
  final double? widthFactor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "heightFactor": <double>,
  ///   "widthFactor": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  static JsonAlignBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAlignBuilder? result;

    if (map != null) {
      result = JsonAlignBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        heightFactor: JsonClass.parseDouble(map['heightFactor']),
        widthFactor: JsonClass.parseDouble(map['widthFactor']),
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

    return Align(
      alignment: alignment!,
      heightFactor: heightFactor,
      key: key,
      widthFactor: widthFactor,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
