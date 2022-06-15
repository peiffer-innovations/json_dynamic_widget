import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAppBarBuilder.type;

    expect(type, 'app_bar');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonAppBarBuilder,
      true,
    );
  });
}
