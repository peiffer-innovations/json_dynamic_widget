import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedCrossFadeBuilder.type;

    expect(type, 'animated_cross_fade');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'crossFadeState': 'showFirst',
          'duration': 1000,
        },
      ) is JsonAnimatedCrossFadeBuilder,
      true,
    );
  });
}
