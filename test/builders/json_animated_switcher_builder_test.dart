import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedSwitcherBuilder.type;

    expect(type, 'animated_switcher');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'child': JsonWidgetData(
            builder: () =>
                JsonWidgetRegistry.instance.getWidgetBuilder('center')({})!,
            type: type,
          ),
          'duration': 1000,
        },
      )! is JsonAnimatedSwitcherBuilder,
      true,
    );
  });
}
