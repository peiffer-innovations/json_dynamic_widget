import 'package:flutter/material.dart';

import 'json_widget_encoders.dart';

abstract class JsonWidgetEncoder<T extends Widget> {
  bool support(Type type);

  String getType();

  dynamic encodeArgs(T widget);

  dynamic encode(Element widgetElement) {
    final widget = widgetElement.widget;
    final jsonWidget = {
      'id': widget.key != null ? widget.key.toString() : '',
      'type': getType(),
      'args': encodeArgs(widget as T),
    };
    final childrenJsonWidgets = [];
    widgetElement.visitChildElements((childElement) {
      final childEncoder = JsonWidgetEncoders.getForWidget(childElement.widget);
      childrenJsonWidgets.add(childEncoder.encode(childElement));
    });
    if (childrenJsonWidgets.length == 1) {
      jsonWidget['child'] = childrenJsonWidgets[0];
    } else if (childrenJsonWidgets.length > 1) {
      jsonWidget['children'] = childrenJsonWidgets;
    }
    return jsonWidget;
  }
}
