import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonRichTextBuilder.kType;

    expect(type, 'rich_text');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'text': 'foo',
      }) is JsonRichTextBuilder,
      true,
    );
  });
}
