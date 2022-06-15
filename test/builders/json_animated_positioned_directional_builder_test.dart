import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedPositionedDirectionalBuilder.type;

    expect(type, 'animated_positioned_directional');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
        },
      ) is JsonAnimatedPositionedDirectionalBuilder,
      true,
    );
  });
}
