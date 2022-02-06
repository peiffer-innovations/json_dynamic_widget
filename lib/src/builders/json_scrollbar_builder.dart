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
    this.hoverThickness,
    this.interactive,
    this.isAlwaysShown,
    this.notificationPredicate,
    this.radius,
    this.scrollbarOrientation,
    this.showTrackOnHover,
    this.thickness,
    this.trackVisibility,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'scrollbar';

  final ScrollController? controller;
  final double? hoverThickness;
  final bool? interactive;
  final bool? isAlwaysShown;
  final ScrollNotificationPredicate? notificationPredicate;
  final Radius? radius;
  final ScrollbarOrientation? scrollbarOrientation;
  final bool? showTrackOnHover;
  final double? thickness;
  final bool? trackVisibility;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "controller": <ScrollController>,
  ///   "hoverThickness": <double>,
  ///   "interactive": <bool>,
  ///   "isAlwaysShown": <bool>,
  ///   "notificationPredicate": <ScrollNotificationPredicate>,
  ///   "radius": <Radius>,
  ///   "scrollbarOrientation": <ScrollbarOrientation>,
  ///   "showTrackOnHover": <bool>,
  ///   "thickness": <double>,
  ///   "trackVisibility": <bool>
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
        hoverThickness: JsonClass.parseDouble(map['hoverThickness']),
        interactive: map['interactive'] == null
            ? null
            : JsonClass.parseBool(
                map['interactive'],
              ),
        isAlwaysShown: map['isAlwaysShown'] == null
            ? null
            : JsonClass.parseBool(
                map['isAlwaysShown'],
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
        showTrackOnHover: map['showTrackOnHover'] == null
            ? null
            : JsonClass.parseBool(
                map['showTrackOnHover'],
              ),
        thickness: JsonClass.parseDouble(map['thickness']),
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
      hoverThickness: hoverThickness,
      interactive: interactive,
      isAlwaysShown: isAlwaysShown,
      notificationPredicate: notificationPredicate,
      radius: radius,
      scrollbarOrientation: scrollbarOrientation,
      showTrackOnHover: showTrackOnHover,
      thickness: thickness,
      trackVisibility: trackVisibility,
      key: key,
      child: child,
    );
  }
}
