import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonIndexedStackBuilder extends JsonWidgetBuilder {
  JsonIndexedStackBuilder({
    this.alignment,
    this.index,
    this.sizing,
    this.textDirection,
  });

  static const type = 'indexed_stack';

  final AlignmentGeometry alignment;
  final int index;
  final StackFit sizing;
  final TextDirection textDirection;

  static JsonIndexedStackBuilder fromDynamic(dynamic map) {
    JsonIndexedStackBuilder result;

    if (map != null) {
      result = JsonIndexedStackBuilder(
        alignment: ThemeDecoder.decodeAlignment(map['alignment']),
        index: JsonClass.parseInt(map['index']),
        sizing: ThemeDecoder.decodeStackFit(map['sizing']),
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
    return IndexedStack(
      alignment: alignment,
      index: index,
      textDirection: textDirection,
      sizing: sizing,
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
