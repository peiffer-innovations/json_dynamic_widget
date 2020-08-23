import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonAnimatedOpacityBuilder extends JsonWidgetBuilder {
  JsonAnimatedOpacityBuilder({
    this.alwaysIncludeSemantics,
    this.curve,
    @required this.duration,
    this.onEnd,
    @required this.opacity,
  });

  static const type = 'animated_opacity';

  final bool alwaysIncludeSemantics;
  final Curve curve;
  final Duration duration;
  final VoidCallback onEnd;
  final double opacity;

  static JsonAnimatedOpacityBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAnimatedOpacityBuilder result;

    if (map != null) {
      result = JsonAnimatedOpacityBuilder(
        alwaysIncludeSemantics: JsonClass.parseBool(
              map['alwaysIncludeSemantics'],
            ) ??
            false,
        curve: map['curve'],
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        ),
        onEnd: map['onEnd'],
        opacity: JsonClass.parseDouble(map['opacity'], 1.0),
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
      data.children?.length == 1,
      '[JsonAnimatedOpacityBuilder] only supports exactly one child.',
    );

    return _JsonAnimatedOpacity(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonAnimatedOpacity extends StatefulWidget {
  _JsonAnimatedOpacity({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonAnimatedOpacityBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  __JsonAnimatedOpacityState createState() => __JsonAnimatedOpacityState();
}

class __JsonAnimatedOpacityState extends State<_JsonAnimatedOpacity> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      alwaysIncludeSemantics: widget.builder.alwaysIncludeSemantics,
      duration: Duration(seconds: 1),
      opacity: widget.builder.opacity,
      child: widget.data.children[0].build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
