import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonStackBuilder extends JsonWidgetBuilder {
  JsonStackBuilder({
    this.alignment,
    this.fit,
    this.overflow,
    this.textDirection,
  });

  static const type = 'stack';

  final AlignmentGeometry alignment;
  final StackFit fit;
  final Overflow overflow;
  final TextDirection textDirection;

  static JsonStackBuilder fromDynamic(dynamic map) {
    JsonStackBuilder result;

    if (map != null) {
      result = JsonStackBuilder(
        alignment: ThemeDecoder.decodeAlignment(map['alignment']),
        fit: ThemeDecoder.decodeStackFit(map['fit']),
        overflow: ThemeDecoder.decodeOverflow(map['overflow']),
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
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
