import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/components/values/curves_values.dart';
import 'package:json_dynamic_widget/src/encoders/json_widget_encoder.dart';
import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme.dart';

class JsonAnimatedAlignEncoder extends JsonWidgetEncoder<AnimatedAlign> {
  @override
  bool support(Type type) {
    return type == AnimatedAlign;
  }

  @override
  dynamic encodeArgs(AnimatedAlign widget) {
    return {
      AnimatedAlignSchemaPropertyKey.alignment:
          ThemeEncoder.encodeAlignmentGeometry(widget.alignment),
      AnimatedAlignSchemaPropertyKey.curve:
          CurvesValues.values.keys.firstWhere((key) => CurvesValues.values[key] == widget.curve),
      AnimatedAlignSchemaPropertyKey.duration: widget.duration.inMilliseconds,
      AnimatedAlignSchemaPropertyKey.heightFactor: widget.heightFactor,
      AnimatedAlignSchemaPropertyKey.onEnd: '\${noop()}',
      AnimatedAlignSchemaPropertyKey.widthFactor: widget.widthFactor,
    };
  }

  @override
  String getType() {
    return 'align';
  }
}
