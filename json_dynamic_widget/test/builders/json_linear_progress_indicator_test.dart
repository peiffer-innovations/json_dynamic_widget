import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonLinearProgressIndicatorBuilder.kType;

    expect(type, 'linear_progress_indicator');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonLinearProgressIndicatorBuilder,
      true,
    );
  });
}
