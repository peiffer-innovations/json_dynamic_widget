import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [IndexedStack] widget.  See the [fromDynamic] for
/// the format.
class JsonIndexedStackBuilder extends JsonWidgetBuilder {
  JsonIndexedStackBuilder({
    required this.alignment,
    this.index,
    required this.sizing,
    this.textDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'indexed_stack';

  final AlignmentGeometry alignment;
  final int? index;
  final StackFit sizing;
  final TextDirection? textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "index": <int>,
  ///   "sizing": <StackFit>,
  ///   "textDirection": <TextDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeStackFit]
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonIndexedStackBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonIndexedStackBuilder? result;

    if (map != null) {
      result = JsonIndexedStackBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            AlignmentDirectional.topStart,
        index: JsonClass.parseInt(map['index'], 0),
        sizing: ThemeDecoder.decodeStackFit(
              map['sizing'],
              validate: false,
            ) ??
            StackFit.loose,
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
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
    return IndexedStack(
      alignment: alignment,
      index: index,
      key: key,
      textDirection: textDirection,
      sizing: sizing,
      children: [
        for (var child in data.children ?? <JsonWidgetData>[])
          child.build(
            context: context,
            childBuilder: childBuilder,
          ),
      ],
    );
  }
}
