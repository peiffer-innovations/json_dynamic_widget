import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonRadioBuilder.type;

    expect(type, 'radio');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({'id': 'foo'})
          is JsonRadioBuilder,
      true,
    );
  });
}
