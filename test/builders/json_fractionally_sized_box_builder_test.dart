import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonFractionallySizedBoxBuilder.type;

    expect(type, 'fractionally_sized_box');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonFractionallySizedBoxBuilder,
      true,
    );
  });
}
