import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonOpacityBuilder extends JsonWidgetBuilder {
  JsonOpacityBuilder({
    this.alwaysIncludeSemantics,
    this.opacity,
  });

  static const type = 'opacity';

  final bool alwaysIncludeSemantics;
  final double opacity;

  static JsonOpacityBuilder fromDynamic(dynamic map) {
    JsonOpacityBuilder result;

    if (map != null) {
      result = JsonOpacityBuilder(
        alwaysIncludeSemantics: map['alwaysIncludeSemantics'] == null
            ? null
            : JsonClass.parseBool(map['alwaysIncludeSemantics']),
        opacity: JsonClass.parseDouble(map['opacity']),
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
      '[JsonOpacityBuilder] only supports exactly one child.',
    );

    return Opacity(
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      opacity: opacity,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
