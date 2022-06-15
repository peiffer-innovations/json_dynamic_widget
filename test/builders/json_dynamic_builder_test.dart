import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonDynamicBuilder.type;

    expect(type, 'dynamic');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'dynamic': {'builderType': 'test'}
      }) is JsonDynamicBuilder,
      true,
    );
  });
}
