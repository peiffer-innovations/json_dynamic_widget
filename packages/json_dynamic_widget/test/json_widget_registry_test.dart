import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/src/components/json_widget_registry.dart';

void main() {
  test('copyWith', () {
    final registry = JsonWidgetRegistry.instance;
    expect(registry.copyWith(), isA<JsonWidgetRegistry>());
  });
}
