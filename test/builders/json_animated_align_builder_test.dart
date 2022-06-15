import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedAlignBuilder.type;

    expect(type, 'animated_align');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'alignment': 'bottomLeft',
          'duration': 1000,
        },
      ) is JsonAnimatedAlignBuilder,
      true,
    );
  });
}
