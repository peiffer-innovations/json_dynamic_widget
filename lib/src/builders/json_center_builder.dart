import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonCenterBuilder extends JsonWidgetBuilder {
  JsonCenterBuilder({
    this.heightFactor,
    this.widthFactor,
  });

  static const type = 'center';

  final double heightFactor;
  final double widthFactor;

  static JsonCenterBuilder fromDynamic(dynamic map) {
    JsonCenterBuilder result;

    if (map != null) {
      result = JsonCenterBuilder(
        heightFactor: JsonClass.parseDouble(map['heightFactor']),
        widthFactor: JsonClass.parseDouble(map['widthFactor']),
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
      '[JsonCenterBuilder] only supports exactly one child.',
    );

    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
