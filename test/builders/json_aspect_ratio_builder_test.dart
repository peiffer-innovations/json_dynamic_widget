import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAspectRatioBuilder.type;

    expect(type, 'aspect_ratio');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonAspectRatioBuilder,
      true,
    );
  });
}
