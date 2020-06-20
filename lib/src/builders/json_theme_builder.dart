import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonThemeBuilder extends JsonWidgetBuilder {
  JsonThemeBuilder({
    this.theme,
    this.isMaterialAppTheme,
  });

  static const type = 'theme';

  final ThemeData theme;
  final bool isMaterialAppTheme;

  static JsonThemeBuilder fromDynamic(dynamic map) {
    JsonThemeBuilder result;
    if (map != null) {
      result = JsonThemeBuilder(
        isMaterialAppTheme: JsonClass.parseBool(map['isMaterialAppTheme']),
        theme: ThemeDecoder.decodeThemeData(map['data']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length != 1,
      '[JsonThemeBuilder] only supports exactly one child.',
    );

    return Theme(
      data: theme,
      isMaterialAppTheme: isMaterialAppTheme,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
