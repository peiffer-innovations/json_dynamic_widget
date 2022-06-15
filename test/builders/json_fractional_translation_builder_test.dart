import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonFractionalTranslationBuilder.type;

    expect(type, 'fractional_translation');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'translation': {
          'dx': 0.0,
          'dy': 0.0,
        }
      }) is JsonFractionalTranslationBuilder,
      true,
    );
  });
}
