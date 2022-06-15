import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonMemoryImageBuilder.type;

    expect(type, 'memory_image');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'image': 'aGVsbG8=',
      }) is JsonMemoryImageBuilder,
      true,
    );
  });
}
