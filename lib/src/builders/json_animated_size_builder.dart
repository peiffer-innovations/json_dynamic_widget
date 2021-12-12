import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedSize] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedSizeBuilder extends JsonWidgetBuilder {
  JsonAnimatedSizeBuilder({
    this.alignment,
    this.clipBehavior,
    this.curve,
    required this.duration,
    this.reverseDuration,
    this.vsync,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_size';

  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final Curve? curve;
  final Duration duration;
  final Duration? reverseDuration;
  final TickerProvider? vsync;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "clipBehavior": <Clip>,
  ///   "curve": <Curve>,
  ///   "duration": <int; millis>,
  ///   "reverseDuration": <int; millis>,
  ///   "vsync": <TickerProvider>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [TickerProvider] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry]. But if
  /// [vsync] is not passed, the widget itself will be the [TickerProvider].
  static JsonAnimatedSizeBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedSizeBuilder? result;

    if (map != null) {
      result = JsonAnimatedSizeBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']),
        curve: map['curve'] ?? Curves.linear,
        duration: JsonClass.parseDurationFromMillis(
          map['duration'],
        )!,
        reverseDuration: JsonClass.parseDurationFromMillis(
          map['reverseDuration'],
        ),
        vsync: map['vsync'],
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
    var child = getChild(data);

    return _JsonAnimatedSize(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedSize extends StatefulWidget {
  _JsonAnimatedSize({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedSizeBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  State<_JsonAnimatedSize> createState() {
    State result = builder.vsync != null
        ? _JsonAnimatedSizeState()
        : _JsonAnimatedSizeStateTicker();
    return result as State<_JsonAnimatedSize>;
  }
}

class _JsonAnimatedSizeState extends State<_JsonAnimatedSize> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: widget.builder.alignment ?? Alignment.center,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      reverseDuration: widget.builder.reverseDuration,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}

class _JsonAnimatedSizeStateTicker extends State<_JsonAnimatedSize> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: widget.builder.alignment ?? Alignment.center,
      clipBehavior: widget.builder.clipBehavior ?? Clip.hardEdge,
      curve: widget.builder.curve ?? Curves.linear,
      duration: widget.builder.duration,
      reverseDuration: widget.builder.reverseDuration,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
