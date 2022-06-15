import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonAssetImageBuilder.type;

    expect(type, 'asset_image');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)({
        'name': 'image.png',
      }) is JsonAssetImageBuilder,
      true,
    );
  });
}
