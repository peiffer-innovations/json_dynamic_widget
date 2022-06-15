import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedPaddingBuilder.type;

    expect(type, 'animated_padding');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
          'padding': EdgeInsets.zero,
        },
      ) is JsonAnimatedPaddingBuilder,
      true,
    );
  });
}
