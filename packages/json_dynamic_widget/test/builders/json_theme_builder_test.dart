import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonThemeBuilder.kType;

    expect(type, 'theme');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonThemeBuilder,
      true,
    );
  });
}
