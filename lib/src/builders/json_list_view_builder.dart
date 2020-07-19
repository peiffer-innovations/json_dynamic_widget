import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [ListView] widget.  See the [fromDynamic] for the
/// format.
class JsonListViewBuilder extends JsonWidgetBuilder {
  JsonListViewBuilder({
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.addSemanticIndexes,
    this.cacheExtent,
    this.controller,
    this.dragStartBehavior,
    this.itemExtent,
    this.padding,
    this.physics,
    this.primary,
    this.reverse,
    this.scrollDirection,
    this.shrinkWrap,
  });

  static const type = 'list_view';

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final ScrollController controller;
  final DragStartBehavior dragStartBehavior;
  final double itemExtent;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  final bool primary;
  final bool reverse;
  final Axis scrollDirection;
  final bool shrinkWrap;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "addAutomaticKeepAlives": <bool>,
  ///   "addRepaintBoundaries": <bool>,
  ///   "addSemanticIndexes": <bool>,
  ///   "cacheExtent": <double>,
  ///   "controller": <ScrollController>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "itemExtent": <double>,
  ///   "padding": <EdgeInsetsGeometry>,
  ///   "physics": <ScrollPhysics>,
  ///   "primary": <bool>,
  ///   "reverse": <bool>,
  ///   "scrollDirection": <Axis>,
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
  ///  * [ThemeDecoder.decodeScrollPhysics]
  static JsonListViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonListViewBuilder result;

    if (map != null) {
      result = JsonListViewBuilder(
        addAutomaticKeepAlives: map['addAutomaticKeepAlives'] == null
            ? true
            : JsonClass.parseBool(map['addAutomaticKeepAlives']),
        addRepaintBoundaries: map['addRepaintBoundaries'] == null
            ? true
            : JsonClass.parseBool(map['addRepaintBoundaries']),
        addSemanticIndexes: map['addSemanticIndexes'] == null
            ? true
            : JsonClass.parseBool(map['addSemanticIndexes']),
        cacheExtent: JsonClass.parseDouble(map['cacheExtent']),
        controller: map['controller'],
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
              map['dragStartBehavior'],
              validate: false,
            ) ??
            DragStartBehavior.start,
        itemExtent: JsonClass.parseDouble(map['itemExtent']),
        padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['padding'],
          validate: false,
        ),
        physics: ThemeDecoder.decodeScrollPhysics(
          map['physics'],
          validate: false,
        ),
        primary: JsonClass.parseBool(map['primary']),
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
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    return ListView.builder(
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      itemCount: data.children?.length ?? 0,
      itemExtent: itemExtent,
      padding: padding,
      physics: physics,
      primary: primary,
      reverse: reverse,
      scrollDirection: scrollDirection,
      semanticChildCount: data.children?.length ?? 0,
      shrinkWrap: shrinkWrap,
      itemBuilder: (BuildContext context, int index) =>
          data.children[index].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
