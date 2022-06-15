import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  test('type', () {
    const type = JsonPopupMenuButtonBuilder.type;

    expect(type, 'popup_menu_button');
    expect(
      JsonWidgetRegistry.instance.getWidgetBuilder(type)(
        {
          'itemBuilder': (BuildContext context) => <PopupMenuEntry>[],
        },
      ) is JsonPopupMenuButtonBuilder,
      true,
    );
  });
}
