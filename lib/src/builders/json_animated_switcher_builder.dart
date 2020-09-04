import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [AnimatedSwitcher] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedSwitcherBuilder extends JsonWidgetBuilder {
  JsonAnimatedSwitcherBuilder({
    @required this.child,
    @required this.duration,
    this.layoutBuilder,
    this.reverseDuration,
    this.switchInCurve,
    this.switchOutCurve,
    this.transitionBuilder,
  }) : assert(duration != null);

  static const type = 'animated_switcher';

  final JsonWidgetData child;
  final Duration duration;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "child": <JsonWidgetData>,
  ///   "duration": <int; millis>,
  ///   "layoutBuilder": <AnimatedCrossFadeBuilder>,
  ///   "reverseDuration": <int; millis>,
  ///   "switchInCurve": <Curve>,
  ///   "switchOutCurve": <Curve>,
  ///   "transitionBuilder": <AnimatedSwitcherTransitionBuilder>,
  /// }
  /// ```
  ///
  /// As a note, the [JsonWidgetData], [Curve], [AnimatedCrossFadeBuilder]
  /// and [AnimatedSwitcherTransitionBuilder] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to
  /// use a function or a variable reference via the [JsonWidgetRegistry].
  /// Also the [child] property should be passed as arg, not as a child.
  static JsonAnimatedSwitcherBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonAnimatedSwitcherBuilder result;

    if (map != null) {
      result = JsonAnimatedSwitcherBuilder(
        child: map['child'],
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        ),
        layoutBuilder:
            map['layoutBuilder'] ?? AnimatedSwitcher.defaultLayoutBuilder,
        reverseDuration: JsonClass.parseDurationFromMillis(
          map['reverseDuration'],
        ),
        switchInCurve: map['switchInCurve'] ?? Curves.linear,
        switchOutCurve: map['switchOutCurve'] ?? Curves.linear,
        transitionBuilder: map['transitionBuilder'] ??
            AnimatedSwitcher.defaultTransitionBuilder,
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
      data.children?.isNotEmpty != true,
      '[JsonAnimatedSwitchBuilder] does not support children outside the [args] parameter.',
    );

    return _JsonAnimatedSwitcher(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonAnimatedSwitcher extends StatefulWidget {
  _JsonAnimatedSwitcher({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonAnimatedSwitcherBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedSwitcherState createState() => _JsonAnimatedSwitcherState();
}

class _JsonAnimatedSwitcherState extends State<_JsonAnimatedSwitcher> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.builder.duration,
      layoutBuilder: widget.builder.layoutBuilder,
      reverseDuration: widget.builder.reverseDuration,
      switchInCurve: widget.builder.switchInCurve,
      switchOutCurve: widget.builder.switchOutCurve,
      transitionBuilder: widget.builder.transitionBuilder,
      child: Container(
        key: GlobalKey(),
        child: widget.builder.child.build(context: context),
      ),
    );
  }
}
