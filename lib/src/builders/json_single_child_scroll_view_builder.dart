import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonSingleChildScrollViewBuilder extends JsonWidgetBuilder {
  JsonSingleChildScrollViewBuilder({
    this.controller,
    this.dragStartBehavior,
    this.padding,
    this.physics,
    this.primary,
    this.reverse,
    this.scrollDirection,
  });

  static const type = 'single_child_scroll_view';

  final ScrollController controller;
  final DragStartBehavior dragStartBehavior;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  final bool primary;
  final bool reverse;
  final Axis scrollDirection;

  static JsonSingleChildScrollViewBuilder fromDynamic(dynamic map) {
    JsonSingleChildScrollViewBuilder result;

    if (map != null) {
      result = JsonSingleChildScrollViewBuilder(
        controller: map['controller'],
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
          map['dragStartBehavior'],
        ),
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']),
        physics: ThemeDecoder.decodeScrollPhysics(map['physics']),
        primary:
            map['primary'] == null ? null : JsonClass.parseBool(map['primary']),
        reverse:
            map['reverse'] == null ? null : JsonClass.parseBool(map['reverse']),
        scrollDirection: ThemeDecoder.decodeAxis(map['scrollDirection']),
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
      '[JsonSingleChildScrollViewBuilder] only supports exactly one child.',
    );

    return SingleChildScrollView(
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      padding: padding,
      physics: physics,
      primary: primary,
      reverse: reverse,
      scrollDirection: scrollDirection,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
