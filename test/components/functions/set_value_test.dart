import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('set_value', () {
    var registry = JsonWidgetRegistry();

    var key = 'key';
    expect(registry.getValue(key), null);

    registry.execute('set_value', [key, 'value'])();
    expect(registry.getValue(key), 'value');

    registry.execute('set_value', [key, 'value2'])();
    expect(registry.getValue(key), 'value2');
  });
}
