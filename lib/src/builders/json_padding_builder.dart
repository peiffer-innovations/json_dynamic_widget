import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonPaddingBuilder extends JsonWidgetBuilder {
  JsonPaddingBuilder({
    @required this.padding,
  }) : assert(padding != null);

  static const type = 'padding';

  final EdgeInsets padding;

  static JsonPaddingBuilder fromDynamic(dynamic map) {
    JsonPaddingBuilder result;

    if (map != null) {
      result = JsonPaddingBuilder(
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']),
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
      '[JsonPaddingBuilder] only supports exactly one child.',
    );

    return Padding(
      padding: padding,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
