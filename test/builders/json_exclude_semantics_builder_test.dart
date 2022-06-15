import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonExcludeSemanticsBuilder.type;

    expect(type, 'exclude_semantics');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonExcludeSemanticsBuilder,
      true,
    );
  });
}
