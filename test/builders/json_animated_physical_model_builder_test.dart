import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedPhysicalModelBuilder.type;

    expect(type, 'animated_physical_model');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'color': '#FFF',
          'duration': 1000,
          'elevation': 0,
          'shadowColor': '#000',
          'shape': 'rectangle',
        },
      ) is JsonAnimatedPhysicalModelBuilder,
      true,
    );
  });
}
