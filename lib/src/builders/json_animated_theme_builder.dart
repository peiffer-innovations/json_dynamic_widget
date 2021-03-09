import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [AnimatedTheme] widget.
/// See the [fromDynamic] for the format.
class JsonAnimatedThemeBuilder extends JsonWidgetBuilder {
  JsonAnimatedThemeBuilder({
    this.curve,
    required this.data,
    this.duration,
    this.onEnd,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'animated_theme';

  final Curve? curve;
  final ThemeData data;
  final Duration? duration;
  final VoidCallback? onEnd;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "curve": <Curve>,
  ///   "data": <ThemeData>,
  ///   "duration": <int; millis>,
  ///   "onEnd": <VoidCallback>,
  /// }
  /// ```
  ///
  /// As a note, the [Curve] and [VoidCallback] cannot be decoded via JSON.
  /// Instead, the only way to bind those values to the builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  static JsonAnimatedThemeBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonAnimatedThemeBuilder? result;

    if (map != null) {
      result = JsonAnimatedThemeBuilder(
        curve: map['curve'] ?? Curves.linear,
        data: ThemeDecoder.decodeThemeData(
          map['data'],
          validate: false,
        )!,
        duration: JsonClass.parseDurationFromMillis(
              map['duration'],
            ) ??
            kThemeAnimationDuration,
        onEnd: map['onEnd'],
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

    return _JsonAnimatedTheme(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonAnimatedTheme extends StatefulWidget {
  _JsonAnimatedTheme({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonAnimatedThemeBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonAnimatedThemeState createState() => _JsonAnimatedThemeState();
}

class _JsonAnimatedThemeState extends State<_JsonAnimatedTheme> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      curve: widget.builder.curve ?? Curves.linear,
      data: widget.builder.data,
      duration: widget.builder.duration ?? kThemeAnimationDuration,
      onEnd: widget.builder.onEnd,
      child: widget.child!.build(
        childBuilder: widget.childBuilder,
        context: context,
      ),
    );
  }
}
