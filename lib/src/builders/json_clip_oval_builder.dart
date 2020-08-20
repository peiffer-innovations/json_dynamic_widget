import 'package:child_builder/child_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class JsonClipOvalBuilder extends JsonWidgetBuilder {
  JsonClipOvalBuilder({this.clipBehavior});

  static const type = 'clip_oval';

  final Clip clipBehavior;

  static JsonClipOvalBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonClipOvalBuilder result;

    if (map != null) {
      result = JsonClipOvalBuilder(
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
      );
    }

    return result;
  }

  @override
  Widget buildCustom(
      {ChildWidgetBuilder childBuilder,
      @required BuildContext context,
      @required JsonWidgetData data,
      Key key}) {
    assert(
      data.children?.length == 1,
      '[JsonClipOvalBuilder] only supports exactly one child.',
    );

    return ClipOval(
      clipBehavior: clipBehavior,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
