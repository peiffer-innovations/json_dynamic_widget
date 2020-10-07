import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/builders/json_widget_builder.dart';
import 'package:json_dynamic_widget/src/models/json_widget_data.dart';
import 'package:json_theme/json_theme.dart';

class JsonElevatedButtonBuilder extends JsonWidgetBuilder {
  JsonElevatedButtonBuilder({
    this.foregroundColorCallback,
    this.style,
  });

  static const type = 'elevated_button';

  final ButtonStyle style;
  final MaterialColor Function(Set<MaterialState>) foregroundColorCallback;

  static JsonElevatedButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonElevatedButtonBuilder result;

    if (map != null) {
      var tempMap = Map.from(map['style']);
      var foregroundColorCallback = tempMap.remove('foregroundColor');

      result = JsonElevatedButtonBuilder(
        style: ThemeDecoder.decodeButtonStyle(
          tempMap,
          validate: false,
        ),
        foregroundColorCallback: foregroundColorCallback,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          foregroundColorCallback,
        ),
      ),
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
