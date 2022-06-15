import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonSliverListBuilder.type;

    expect(type, 'sliver_list');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({})
          is JsonSliverListBuilder,
      true,
    );
  });
}
