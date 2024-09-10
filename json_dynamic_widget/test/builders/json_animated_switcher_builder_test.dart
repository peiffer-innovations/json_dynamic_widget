import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedSwitcherBuilder.kType;

    expect(type, 'animated_switcher');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'child': JsonWidgetData(
            jsonWidgetBuilder: () =>
                JsonWidgetRegistry.instance.getWidgetBuilder('center')({}),
            jsonWidgetType: type,
          ),
          'duration': 1000,
        },
      ) is JsonAnimatedSwitcherBuilder,
      true,
    );
  });
}
