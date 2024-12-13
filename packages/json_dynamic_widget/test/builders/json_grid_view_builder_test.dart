import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonGridViewBuilder.kType;

    expect(type, 'grid_view');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonGridViewBuilder,
      true,
    );
  });
}
