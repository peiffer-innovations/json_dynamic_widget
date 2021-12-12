import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonTestableBuilder.type;

    expect(type, 'testable');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonTestableBuilder,
      true,
    );
  });
}
