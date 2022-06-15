import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonLayoutBuilderBuilder.type;

    expect(type, 'layout_builder');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonLayoutBuilderBuilder,
      true,
    );
  });
}
