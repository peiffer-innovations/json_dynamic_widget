import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonFlexibleBuilder extends JsonWidgetBuilder {
  JsonFlexibleBuilder({
    this.fit,
    this.flex,
  });

  static const type = 'flexible';

  final FlexFit fit;
  final int flex;

  static JsonFlexibleBuilder fromDynamic(dynamic map) {
    JsonFlexibleBuilder result;

    if (map != null) {
      result = JsonFlexibleBuilder(
        fit: ThemeDecoder.decodeFlexFit(map['fit']),
        flex: JsonClass.parseInt(map['flex']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonFlexibleBuilder] only supports exactly one child.',
    );

    return Flexible(
      fit: fit,
      flex: flex,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
