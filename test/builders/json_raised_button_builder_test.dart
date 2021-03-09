import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonRaisedButtonBuilder.type;

    expect(type, 'raised_button');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type) is Function,
      true,
    );
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonRaisedButtonBuilder,
      true,
    );
  });
}
