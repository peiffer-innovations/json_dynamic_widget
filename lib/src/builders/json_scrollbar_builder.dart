import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Scrollbar] widget.  See the [fromDynamic] for the
/// format.
class JsonScrollbarBuilder extends JsonWidgetBuilder {
  JsonScrollbarBuilder({
    this.controller,
    this.interactive,
    this.notificationPredicate,
    this.radius,
    this.scrollbarOrientation,
    this.thickness,
    this.trackVisibility,
    this.thumbVisibility,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'scrollbar';

  final ScrollController? controller;
  final bool? interactive;
  final ScrollNotificationPredicate? notificationPredicate;
  final Radius? radius;
  final ScrollbarOrientation? scrollbarOrientation;
  final double? thickness;
  final bool? trackVisibility;
  final bool? thumbVisibility;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "controller": <ScrollController>,
  ///   "interactive": <bool>,
  ///   "notificationPredicate": <ScrollNotificationPredicate>,
  ///   "radius": <Radius>,
  ///   "scrollbarOrientation": <ScrollbarOrientation>,
  ///   "thickness": <double>,
  ///   "trackVisibility": <bool>,
  ///   "thumbVisibility": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeRadius]
  ///  * [ThemeDecoder.decodeScrollbarOrientation]
  static JsonScrollbarBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonScrollbarBuilder? result;
    if (map != null) {
      result = JsonScrollbarBuilder(
        controller: map['controller'],
        interactive: map['interactive'] == null
            ? null
            : JsonClass.parseBool(
                map['interactive'],
              ),
        notificationPredicate: map['notificationPredicate'],
        radius: ThemeDecoder.decodeRadius(
          map['radius'],
          validate: false,
        ),
        scrollbarOrientation: ThemeDecoder.decodeScrollbarOrientation(
          map['scrollbarOrientation'],
          validate: false,
        ),
        thickness: JsonClass.parseDouble(map['thickness']),
        thumbVisibility: map['thumbVisibility'] == null
            ? null
            : JsonClass.parseBool(
                map['thumbVisibility'],
              ),
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
    var child = getChild(data).build(
      childBuilder: childBuilder,
      context: context,
    );
    return Scrollbar(
      controller: controller,
      interactive: interactive,
      notificationPredicate: notificationPredicate,
      radius: radius,
      scrollbarOrientation: scrollbarOrientation,
      thickness: thickness,
      thumbVisibility: thumbVisibility,
      trackVisibility: trackVisibility,
      key: key,
      child: child,
    );
  }
}
