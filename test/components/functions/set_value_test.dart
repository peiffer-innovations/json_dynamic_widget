import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('set_value', () {
    var registry = JsonWidgetRegistry();

    var key = 'key';
    expect(registry.getValue(key), null);

    registry.getFunction('set_value')!(
        args: [key, 'value'], registry: registry)();
    expect(registry.getValue(key), 'value');

    registry.getFunction('set_value')!(
        args: [key, 'value2'], registry: registry)();
    expect(registry.getValue(key), 'value2');
  });
}
