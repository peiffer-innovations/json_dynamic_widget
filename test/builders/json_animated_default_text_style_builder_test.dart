import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedDefaultTextStyleBuilder.type;

    expect(type, 'animated_default_text_style');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
          'style': {
            'color': '#FFF',
          }
        },
      ) is JsonAnimatedDefaultTextStyleBuilder,
      true,
    );
  });
}
