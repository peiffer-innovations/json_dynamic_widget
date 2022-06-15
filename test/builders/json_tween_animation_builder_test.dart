import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonTweenAnimationBuilder.type;

    expect(type, 'tween_animation');

    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'builder': (context, val, child) => SizedBox(),
          'duration': 1000,
          'tween': Tween(begin: 0, end: 0),
        },
      )! is JsonTweenAnimationBuilder,
      true,
    );
  });
}
