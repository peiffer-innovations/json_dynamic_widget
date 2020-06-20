import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonColumnBuilder extends JsonWidgetBuilder {
  JsonColumnBuilder({
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.textBaseline,
    this.textDirection,
  });

  static const type = 'column';

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;

  static JsonColumnBuilder fromDynamic(dynamic map) {
    JsonColumnBuilder result;

    if (map != null) {
      result = JsonColumnBuilder(
        crossAxisAlignment: ThemeDecoder.decodeCrossAxisAlignment(
              map['crossAxisAlignment'],
            ) ??
            CrossAxisAlignment.start,
        mainAxisAlignment: ThemeDecoder.decodeMainAxisAlignment(
              map['mainAxisAlignment'],
            ) ??
            MainAxisAlignment.start,
        mainAxisSize: ThemeDecoder.decodeMainAxisSize(map['mainAxisSize']) ??
            MainAxisSize.min,
        textBaseline: ThemeDecoder.decodeTextBaseline(map['textBaseline']),
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
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
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
