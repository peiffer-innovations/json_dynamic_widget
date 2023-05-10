import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_animated_align_encoder.dart';

import 'json_align_encoder.dart';
import 'json_column_encoder.dart';
import 'json_unknown_encoder.dart';
import 'json_widget_encoder.dart';

abstract class JsonWidgetEncoders {
  static final List<JsonWidgetEncoder> _encoders = [
    JsonColumnEncoder(),
    JsonAlignEncoder(),
    JsonAnimatedAlignEncoder(),
    JsonUnknownEncoder()
  ];

  static JsonWidgetEncoder getForWidget(Widget widget) {
    return _encoders.firstWhere((encoder) => encoder.support(widget.runtimeType));
  }
}