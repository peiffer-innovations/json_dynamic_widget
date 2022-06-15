import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedContainerBuilder.type;

    expect(type, 'animated_container');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'duration': 1000,
        },
      ) is JsonAnimatedContainerBuilder,
      true,
    );
  });
}
