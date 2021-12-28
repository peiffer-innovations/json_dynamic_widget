import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [CustomScrollView] widget.  See the
/// [fromDynamic] for the format.
class JsonCustomScrollViewBuilder extends JsonWidgetBuilder {
  JsonCustomScrollViewBuilder({
    this.anchor,
    this.cacheExtent,
    this.center,
    required this.clipBehavior,
    this.controller,
    required this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.physics,
    this.primary,
    this.restorationId,
    required this.reverse,
    this.scrollBehavior,
    required this.scrollDirection,
    this.semanticChildCount,
    required this.shrinkWrap,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'custom_scroll_view';

  final double? anchor;
  final double? cacheExtent;
  final Key? center;
  final Clip clipBehavior;
  final ScrollController? controller;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final ScrollPhysics? physics;
  final bool? primary;
  final String? restorationId;
  final bool reverse;
  final ScrollBehavior? scrollBehavior;
  final Axis scrollDirection;
  final int? semanticChildCount;
  final bool shrinkWrap;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "anchor": <double>,
  ///   "cacheExtent": <double>,
  ///   "clipBehavior": <Clip>,
  ///   "center": <Key>,
  ///   "controller": <ScrollController>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "keyboardDismissBehavior": <ScrollViewKeyboardDismissBehavior>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "physics": <ScrollPhysics>,
  ///   "primary": <bool>,
  ///   "restorationId": <String>,
  ///   "reverse": <bool>,
  ///   "scrollBehavior": <ScrollBehavior>,
  ///   "scrollDirection": <Axis>,
  ///   "semanticChildCount": <int>,
  ///   "shrinkWrap": <bool>
  /// }
  /// ```
  ///
  /// As a note, the [ScrollController] cannot be decoded via JSON.  Instead,
  /// the only way to bind those values to the builder is to use a function or a
  /// variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAxis]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeScrollBehavior]
  ///  * [ThemeDecoder.decodeScrollPhysics]
  ///  * [ThemeDecoder.decodeScrollViewKeyboardDismissBehavior]
  static JsonCustomScrollViewBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonCustomScrollViewBuilder? result;

    if (map != null) {
      result = JsonCustomScrollViewBuilder(
        anchor: JsonClass.parseDouble(map['anchor']),
        cacheExtent: JsonClass.parseDouble(map['cacheExtent']),
        center:
            map['center'] is String ? ValueKey(map['center']) : map['center'],
        clipBehavior:
            ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
        controller: map['controller'],
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
              map['dragStartBehavior'],
              validate: false,
            ) ??
            DragStartBehavior.start,
        keyboardDismissBehavior:
            ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
          map['keyboardDismissBehavior'],
          validate: false,
        ),
        physics: ThemeDecoder.decodeScrollPhysics(
          map['physics'],
          validate: false,
        ),
        primary:
            map['primary'] == null ? null : JsonClass.parseBool(map['primary']),
        restorationId: map['restorationId'],
        reverse: JsonClass.parseBool(map['reverse']),
        scrollBehavior: ThemeDecoder.decodeScrollBehavior(
          map['scrollBehavior'],
          validate: false,
        ),
        scrollDirection: ThemeDecoder.decodeAxis(
              map['scrollDirection'],
              validate: false,
            ) ??
            Axis.vertical,
        semanticChildCount: JsonClass.parseInt(map['semanticChildCount']),
        shrinkWrap: JsonClass.parseBool(map['shrinkWrap']),
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
    var children = [
      for (var child in data.children ?? <JsonWidgetData>[])
        child.build(
          context: context,
          childBuilder: childBuilder,
        ),
    ];

    return CustomScrollView(
      anchor: anchor ?? 0.0,
      cacheExtent: cacheExtent,
      center: center,
      clipBehavior: clipBehavior,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      key: key,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      physics: physics,
      primary: primary,
      restorationId: restorationId,
      reverse: reverse,
      scrollBehavior: scrollBehavior,
      scrollDirection: scrollDirection,
      semanticChildCount: semanticChildCount,
      shrinkWrap: shrinkWrap,
      slivers: children,
    );
  }
}
