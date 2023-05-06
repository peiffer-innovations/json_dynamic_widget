import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_widget_encoder.dart';
import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme.dart';

class JsonColumnEncoder extends JsonWidgetEncoder<Column> {
  @override
  bool support(Type type) {
    return type == Column;
  }

  @override
  dynamic encodeArgs(Column widget) {
    return {
      ColumnSchemaPropertyKey.crossAxisAlignment:
          ThemeEncoder.encodeCrossAxisAlignment(widget.crossAxisAlignment),
      ColumnSchemaPropertyKey.mainAxisAlignment:
          ThemeEncoder.encodeMainAxisAlignment(widget.mainAxisAlignment),
      ColumnSchemaPropertyKey.mainAxisSize: ThemeEncoder.encodeMainAxisSize(widget.mainAxisSize),
      ColumnSchemaPropertyKey.textBaseline: ThemeEncoder.encodeTextBaseline(widget.textBaseline),
      ColumnSchemaPropertyKey.textDirection: ThemeEncoder.encodeTextDirection(widget.textDirection),
      ColumnSchemaPropertyKey.verticalDirection:
          ThemeEncoder.encodeVerticalDirection(widget.verticalDirection),
    };
  }

  @override
  String getType() {
    return 'column';
  }
}
