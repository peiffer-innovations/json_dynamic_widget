import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonClipPathBuilder.type;

    expect(type, 'clip_path');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonClipPathBuilder,
      true,
    );
  });
}
