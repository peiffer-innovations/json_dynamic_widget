import 'package:flutter/material.dart';

abstract class JsonWidgetEncoder<T extends Widget> {
  bool support(Type type);

  String getType();

  dynamic encodeArgs(T widget);

  dynamic encode(T widget) {
    return {
      'id': widget.key != null ? widget.key.toString() : '',
      'type': getType(),
      'args': encodeArgs(widget),
    };
  }
}