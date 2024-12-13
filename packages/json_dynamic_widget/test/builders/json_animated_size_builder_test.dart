import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedSizeBuilder.kType;

    expect(type, 'animated_size');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
        },
      ) is JsonAnimatedSizeBuilder,
      true,
    );
  });
}
