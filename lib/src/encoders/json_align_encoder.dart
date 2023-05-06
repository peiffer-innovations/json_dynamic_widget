import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_widget_encoder.dart';
import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme.dart';

class JsonAlignEncoder extends JsonWidgetEncoder<Align> {
  @override
  bool support(Type type) {
    return type == Align;
  }

  @override
  dynamic encodeArgs(Align widget) {
    return {
      AlignSchemaPropertyKey.alignment:
          ThemeEncoder.encodeAlignment(widget.alignment as Alignment?),
      AlignSchemaPropertyKey.heightFactor: widget.heightFactor,
      AlignSchemaPropertyKey.widthFactor: widget.widthFactor
    };
  }

  @override
  String getType() {
    return 'align';
  }
}
