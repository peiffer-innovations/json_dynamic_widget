import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Hero] widget.  See the [fromDynamic] for the
/// format.
class JsonHeroBuilder extends JsonWidgetBuilder {
  JsonHeroBuilder({
    this.createRectTween,
    this.flightShuttleBuilder,
    this.placeholderBuilder,
    required this.tag,
    required this.transitionOnUserGestures,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'hero';

  final CreateRectTween? createRectTween;
  final HeroFlightShuttleBuilder? flightShuttleBuilder;
  final HeroPlaceholderBuilder? placeholderBuilder;
  final Object tag;
  final bool transitionOnUserGestures;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "createRectTween": <CreateRectTween>,
  ///   "flightShuttleBuilder": <HeroFlightShuttleBuilder>,
  ///   "placeholderBuilder": <HeroPlaceholderBuilder>,
  ///   "tag": <Object>,
  ///   "transitionOnUserGestures": <bool>
  /// }
  /// ```
  ///
  /// As a note, the [CreateRectTween], [HeroFlightShuttleBuilder] and
  /// [HeroPlaceholderBuilder] cannot be decoded via JSON.  Instead, the only
  /// way to bind those values to the builder is to use a function or a variable
  /// reference via the [JsonWidgetRegistry].
  static JsonHeroBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonHeroBuilder? result;

    if (map != null) {
      result = JsonHeroBuilder(
        createRectTween: map['createRectTween'],
        flightShuttleBuilder: map['flightShuttleBuilder'],
        placeholderBuilder: map['placeholderBuilder'],
        tag: map['tag'],
        transitionOnUserGestures:
            JsonClass.parseBool(map['transitionOnUserGestures']),
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

    return Hero(
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      key: key,
      placeholderBuilder: placeholderBuilder,
      tag: tag,
      transitionOnUserGestures: transitionOnUserGestures,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
