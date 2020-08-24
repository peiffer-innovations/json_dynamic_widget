import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedOpacityBuilder.type;

    expect(type, 'animated_opacity');
    expect(JsonWidgetRegistry.instance.getWidgetBuilder(type) != null, true);
    expect(
<<<<<<< HEAD
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
          'opacity': 1,
        },
      ) is JsonAnimatedOpacityBuilder,
=======
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonAnimatedOpacityBuilder,
>>>>>>> f50cbc3... Added docs and tests for AnimatedOpacity
      true,
    );
  });
}
