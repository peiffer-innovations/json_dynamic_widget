import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonConditionalBuilder.kType;

    expect(type, 'conditional');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
            'conditional': {'values': {}},
          })
          is JsonConditionalBuilder,
      true,
    );
  });
}
