import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonDecoratedBoxBuilder.type;

    expect(type, 'decorated_box');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'decoration': {
          'shape': 'circle',
        },
      }) is JsonDecoratedBoxBuilder,
      true,
    );
  });
}
