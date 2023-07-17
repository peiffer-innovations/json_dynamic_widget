import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [GridView] widget.  See the [fromDynamic] for the
/// format.
class JsonGridViewBuilder extends JsonWidgetBuilder {
  const JsonGridViewBuilder({
    required this.addAutomaticKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    this.cacheExtent,
    required this.clipBehavior,
    this.controller,
    required this.dragStartBehavior,
    this.findChildIndexCallback,
    required this.gridDelegate,
    required this.keyboardDismissBehavior,
    this.padding,
    this.physics,
    required this.primary,
    this.restorationId,
    required this.reverse,
    required this.scrollDirection,
    required this.shrinkWrap,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'grid_view';

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final Clip clipBehavior;
  final ScrollController? controller;
  final DragStartBehavior dragStartBehavior;
  final ChildIndexGetter? findChildIndexCallback;
  final dynamic gridDelegate;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool primary;
  final String? restorationId;
  final bool reverse;
  final Axis scrollDirection;
  final bool shrinkWrap;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "addAutomaticKeepAlives": "<bool>",
  ///   "addRepaintBoundaries": "<bool>",
  ///   "addSemanticIndexes": "<bool>",
  ///   "cacheExtent": "<double>",
  ///   "clipBehavior": "<Clip>",
  ///   "controller": "<ScrollController>",
  ///   "dragStartBehavior": "<DragStartBehavior>",
  ///   "findChildIndexCallback": "<ChildIndexGetter>",
  ///   "gridDelegate": "<SliverGridDelegate>",
  ///   "keyboardDismissBehavior": "<ScrollViewKeyboardDismissBehavior>",
  ///   "padding": "<EdgeInsetsGeometry>",
  ///   "physics": "<ScrollPhysics>",
  ///   "primary": "<bool>",
  ///   "prototypeItem": "<JsonWidgetData>",
  ///   "restorationId": "<String>",
  ///   "reverse": "<bool>",
  ///   "scrollDirection": "<Axis>",
  ///   "shrinkWrap": "<bool>"
  /// }
  /// ```
  ///
  /// As a note, the [ScrollController] cannot be decoded via JSON.  Instead,
  /// the only way to bind those values to the builder is to use a function or a
  /// variable reference via the [JsonWidgetRegistry].
  ///
  /// The "gridDelegate" can be passed in via a variable or it can be decoded
  /// using one of the two schemas:
  /// ```json
  /// {
  ///   "type": "max_cross_axis_extent",
  ///   "childAspectRatio": "<double?>",
  ///   "crossAxisSpacing": "<double?>",
  ///   "mainAxisExtent": "<double?>",
  ///   "mainAxisSpacing": "<double?>",
  ///   "maxCrossAxisExtent": "<double>"
  /// }
  /// ```
  ///
  /// ... or ...
  ///
  /// ```json
  /// {
  ///   "type": "fixed_cross_axis_count",
  ///   "crossAxisCount": "<int>",
  ///   "childAspectRatio": "<double?>",
  ///   "crossAxisSpacing": "<double?>",
  ///   "mainAxisExtent": "<double?>",
  ///   "mainAxisSpacing": "<double?>"
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAxis]
  ///  * [ThemeDecoder.decodeClip]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeScrollPhysics]
  static JsonGridViewBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonGridViewBuilder? result;

    if (map != null) {
      result = JsonGridViewBuilder(
        addAutomaticKeepAlives: map['addAutomaticKeepAlives'] == null
            ? true
            : JsonClass.parseBool(map['addAutomaticKeepAlives']),
        addRepaintBoundaries: map['addRepaintBoundaries'] == null
            ? true
            : JsonClass.parseBool(map['addRepaintBoundaries']),
        addSemanticIndexes: map['addSemanticIndexes'] == null
            ? true
            : JsonClass.parseBool(map['addSemanticIndexes']),
        cacheExtent: JsonClass.maybeParseDouble(map['cacheExtent']),
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
        controller: map['controller'],
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
              map['dragStartBehavior'],
              validate: false,
            ) ??
            DragStartBehavior.start,
        findChildIndexCallback: map['findChildIndexCallback'],
        gridDelegate: map['gridDelegate'],
        keyboardDismissBehavior:
            ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(
                  map['keyboardDismissBehavior'],
                  validate: false,
                ) ??
                ScrollViewKeyboardDismissBehavior.manual,
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ) as EdgeInsets?,
        physics: ThemeDecoder.decodeScrollPhysics(
          map['physics'],
          validate: false,
        ),
        primary: JsonClass.parseBool(map['primary']),
        restorationId: map['restorationId'],
        reverse: JsonClass.parseBool(map['reverse']),
        scrollDirection: ThemeDecoder.decodeAxis(
              map['scrollDirection'],
              validate: false,
            ) ??
            Axis.vertical,
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
    return GridView.builder(
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      findChildIndexCallback: findChildIndexCallback,
      gridDelegate: SliverGridDelegateDecoder.decodeGridDelegate(
        gridDelegate: gridDelegate,
      ),
      itemCount: data.children?.length ?? 0,
      key: key,
      keyboardDismissBehavior: keyboardDismissBehavior,
      padding: padding,
      physics: physics,
      primary: primary,
      restorationId: restorationId,
      reverse: reverse,
      scrollDirection: scrollDirection,
      semanticChildCount: data.children?.length ?? 0,
      shrinkWrap: shrinkWrap,
      itemBuilder: (BuildContext context, int index) {
        final w = data.children![index].build(
          childBuilder: childBuilder,
          context: context,
        );
        return w;
      },
    );
  }
}
