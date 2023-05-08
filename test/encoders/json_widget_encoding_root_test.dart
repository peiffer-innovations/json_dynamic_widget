import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/src/encoders/json_widget_encoding_root.dart';

void main() {
  testWidgets('JsonWidgetEncodingRoot generation test', (WidgetTester tester) async {
    const expected =
        '{"id":"","type":"column","args":{"crossAxisAlignment":"center","mainAxisAlignment":"start","mainAxisSize":"max","textBaseline":null,"textDirection":null,"verticalDirection":"down"},"children":[{"id":"","type":"align","args":{"alignment":"bottomCenter","heightFactor":2.0,"widthFactor":1.0}},{"id":"","type":"align","args":{"alignment":"bottomLeft","heightFactor":1.0,"widthFactor":1.0}}]}';
    final encoderWidget = JsonWidgetEncodingRoot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 2,
            widthFactor: 1,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            widthFactor: 1,
          ),
        ],
      ),
    );
    await tester.pumpWidget(encoderWidget);

    final encoded = jsonEncode(encoderWidget.encode());

    // ignore_for_file: avoid_print
    print(encoded);
    expect(
      encoded,
      expected,
    );
  });
}
