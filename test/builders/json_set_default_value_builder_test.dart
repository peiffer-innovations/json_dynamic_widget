import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonSetDefaultValueBuilder.type;

    expect(type, 'set_default_value');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonSetDefaultValueBuilder,
      true,
    );
  });
}
