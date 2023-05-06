import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_column_encoder.dart';

import 'json_align_encoder.dart';
import 'json_unknown_encoder.dart';
import 'json_widget_encoder.dart';

class JsonWidgetEncodersWidget extends StatelessWidget {
  JsonWidgetEncodersWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  final GlobalKey globalKey = GlobalKey();
  final List<JsonWidgetEncoder> _encoders = [
    JsonColumnEncoder(),
    JsonAlignEncoder(),
    JsonUnknownEncoder()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: child,
    );
  }

  dynamic encode() {
    var jsonWidget = {};
    final context = globalKey.currentContext!;
    context.visitChildElements((childElement) {
      jsonWidget = _encodeSingle(childElement);
    });
    return jsonWidget;
  }

  dynamic _encodeSingle(Element widgetElement) {
    final widget = widgetElement.widget;
    final encoder = _encoders.firstWhere((encoder) => encoder.support(widget.runtimeType));
    final jsonWidget = encoder.encode(widget);
    final childrenJsonWidgets = [];
    widgetElement.visitChildElements((childElement) {
      childrenJsonWidgets.add(_encodeSingle(childElement));
    });
    if (childrenJsonWidgets.length == 1) {
      jsonWidget['child'] = childrenJsonWidgets[0];
    } else if (childrenJsonWidgets.length > 1) {
      jsonWidget['children'] = childrenJsonWidgets;
    }
    return jsonWidget;
  }
}
