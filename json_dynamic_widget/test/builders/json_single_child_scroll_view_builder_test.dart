import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonSingleChildScrollViewBuilder.kType;

    expect(type, 'single_child_scroll_view');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonSingleChildScrollViewBuilder,
      true,
    );
  });
}
