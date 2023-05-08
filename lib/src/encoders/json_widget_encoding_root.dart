import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/src/encoders/json_column_encoder.dart';

import 'json_align_encoder.dart';
import 'json_unknown_encoder.dart';
import 'json_widget_encoder.dart';
import 'json_widget_encoders.dart';

class JsonWidgetEncodingRoot extends StatelessWidget {
  JsonWidgetEncodingRoot({
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
    context.visitChildElements((widgetElement) {
      final widgetEncoder = JsonWidgetEncoders.getForWidget(widgetElement.widget);
      jsonWidget = widgetEncoder.encode(widgetElement);
    });
    return jsonWidget;
  }
}
