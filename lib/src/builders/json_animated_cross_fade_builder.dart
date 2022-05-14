import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedCrossFade] widget.
/// See the [fromDynamic] for the format. The ordering of the
/// children in JSON determines which will be the first or
/// second to be rendered.
class JsonAnimatedCrossFadeBuilder extends JsonWidgetBuilder {
  JsonAnimatedCrossFadeBuilder({
    this.alignment,
    required this.crossFadeState,
    required this.duration,
    this.excludeBottomFocus = true,
    this.firstCurve,
    this.layoutBuilder,
    this.reverseDuration,
    this.secondCurve,
    this.sizeCurve,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 2;
  static const type = 'animated_cross_fade';

  final AlignmentGeometry? alignment;
  final CrossFadeState crossFadeState;
  final Duration duration;
  final bool excludeBottomFocus;
  final Curve? firstCurve;
  final AnimatedCrossFadeBuilder? layoutBuilder;
  final Duration? reverseDuration;
  final Curve? secondCurve;
  final Curve? sizeCurve;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "crossFadeState": <CrossFadeState>,
  ///   "duration": <int; millis>,
  ///   "excludeBottomFocus": <bool>,
  ///   "firstCurve": <Curve>,
  ///   "layoutBuilder": <AnimatedCrossFadeBuilder>,
  ///   "reverseDuration": <int; millis>,
  ///   "secondCurve": <Curve>,
  ///   "sizeCurve": <Curve>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [AnimatedCrossFadeBuilder] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedCrossFadeBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedCrossFadeBuilder? result;

    if (map != null) {
      result = JsonAnimatedCrossFadeBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.topCenter,
        crossFadeState: ThemeDecoder.decodeCrossFadeState(
          map['crossFadeState'],
          validate: false,
        )!,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        excludeBottomFocus: JsonClass.parseBool(
          map['excludeBottomFocus'],
          whenNull: true,
        ),
        firstCurve: map['firstCurve'] ?? Curves.linear,
        layoutBuilder:
            map['layoutBuilder'] ?? AnimatedCrossFade.defaultLayoutBuilder,
        reverseDuration: JsonClass.parseDurationFromMillis(
          map['reverseDuration'],
        ),
        secondCurve: map['secondCurve'] ?? Curves.linear,
        sizeCurve: map['sizeCurve'] ?? Curves.linear,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var firstChild = getChild(data, index: 0);
    var secondChild = getChild(data, index: 1);
    assert(
      data.children?.length == 2,
      '[JsonAnimatedCrossFadeBuilder] only supports exactly two children.',
    );

    return _JsonAnimatedCrossFade(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      firstChild: firstChild,
      key: key,
      secondChild: secondChild,
    );
  }
}

class _JsonAnimatedCrossFade extends StatefulWidget {
  _JsonAnimatedCrossFade({
    required this.builder,
    required this.childBuilder,
    required this.data,
    required this.firstChild,
    Key? key,
    required this.secondChild,
  }) : super(key: key);

  final JsonAnimatedCrossFadeBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final JsonWidgetData? firstChild;
  final JsonWidgetData? secondChild;

  @override
  _JsonAnimatedCrossFadeState createState() => _JsonAnimatedCrossFadeState();
}

class _JsonAnimatedCrossFadeState extends State<_JsonAnimatedCrossFade> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: widget.builder.alignment ?? Alignment.topCenter,
      crossFadeState: widget.builder.crossFadeState,
      duration: widget.builder.duration,
      excludeBottomFocus: widget.builder.excludeBottomFocus,
      firstCurve: widget.builder.firstCurve ?? Curves.linear,
      layoutBuilder: widget.builder.layoutBuilder ??
          AnimatedCrossFade.defaultLayoutBuilder,
      reverseDuration: widget.builder.reverseDuration,
      secondCurve: widget.builder.secondCurve ?? Curves.linear,
      sizeCurve: widget.builder.sizeCurve ?? Curves.linear,
      firstChild: widget.firstChild!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
      secondChild: widget.secondChild!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
