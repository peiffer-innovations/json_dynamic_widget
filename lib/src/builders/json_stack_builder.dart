import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Stack] widget.  See the [fromDynamic] for the
/// format.
class JsonStackBuilder extends JsonWidgetBuilder {
  JsonStackBuilder({
    this.alignment,
    this.clipBehavior,
    this.fit,
    this.overflow,
    this.textDirection,
  });

  static const type = 'stack';

  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final StackFit fit;
  final Overflow overflow;
  final TextDirection textDirection;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <Alignment>,
  ///   "clipBehavior": <Clip>,
  ///   "fit": <StackFit>,
  ///   "overflow": <Overflow>,
  ///   "textDirection": <TextDirection>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeStackFit]
  ///  * [ThemeDecoder.decodeOverflow]
  ///  * [ThemeDecoder.decodeTextDirection]
  static JsonStackBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonStackBuilder result;

    if (map != null) {
      result = JsonStackBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            AlignmentDirectional.topStart,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
        fit: ThemeDecoder.decodeStackFit(
              map['fit'],
              validate: false,
            ) ??
            StackFit.loose,
        overflow: ThemeDecoder.decodeOverflow(
              map['overflow'],
              validate: false,
            ) ??
            Overflow.clip,
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
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    return Stack(
      alignment: alignment,
      clipBehavior: clipBehavior,
      fit: fit,
      overflow: overflow,
      textDirection: textDirection,
      children: [
        for (var child in data.children ?? [])
          child.build(
            context: context,
            childBuilder: childBuilder,
          ),
      ],
    );
  }
}
