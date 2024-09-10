import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonNetworkImageBuilder.kType;

    expect(type, 'network_image');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'src': 'http://github.com',
      }) is JsonNetworkImageBuilder,
      true,
    );
  });
}
