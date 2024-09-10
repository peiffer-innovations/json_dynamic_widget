import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAnimatedCrossFadeBuilder.kType;

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
