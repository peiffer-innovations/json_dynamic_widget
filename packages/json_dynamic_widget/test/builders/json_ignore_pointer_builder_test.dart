import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonIgnorePointerBuilder.kType;

    expect(type, 'ignore_pointer');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonIgnorePointerBuilder,
      true,
    );
  });
}
