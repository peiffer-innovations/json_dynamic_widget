import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonDirectionalityBuilder.type;

    expect(type, 'directionality');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'textDirection': 'ltr',
        },
      ) is JsonDirectionalityBuilder,
      true,
    );
  });
}
