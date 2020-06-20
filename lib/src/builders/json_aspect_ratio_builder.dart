import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonAspectRatioBuilder extends JsonWidgetBuilder {
  JsonAspectRatioBuilder({
    this.aspectRatio,
  });

  static const type = 'aspect_ratio';

  final double aspectRatio;

  static JsonAspectRatioBuilder fromDynamic(dynamic map) {
    JsonAspectRatioBuilder result;

    if (map != null) {
      result = JsonAspectRatioBuilder(
        aspectRatio: JsonClass.parseDouble(map['aspectRatio']),
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
      '[JsonAspectRatioBuilder] only supports exactly one child.',
    );

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
