import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_widget_encoder.dart';

class JsonUnknownEncoder extends JsonWidgetEncoder<Widget> {
  @override
  bool support(Type type) {
    return true;
  }

  @override
  dynamic encodeArgs(Widget widget) {
    return {};
  }

  @override
  String getType() {
    return 'sized_box';
  }
}
