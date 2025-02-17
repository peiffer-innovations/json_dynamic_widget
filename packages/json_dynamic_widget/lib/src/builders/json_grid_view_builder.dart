// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_grid_view_builder.g.dart';

/// Builder that can build an [GridView] widget.
@jsonWidget
abstract class _JsonGridViewBuilder extends JsonWidgetBuilder {
  const _JsonGridViewBuilder({required super.args});

  @JsonArgDecoder('gridDelegate')
  SliverGridDelegate _decodeGridDelecate({required dynamic value}) =>
      SliverGridDelegateDecoder.decodeGridDelegate(gridDelegate: value);

  @override
  _GridView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _GridView extends StatelessWidget {
  const _GridView({
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.childBuilder,
    this.children,
    this.clipBehavior = Clip.hardEdge,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.findChildIndexCallback,
    required this.gridDelegate,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.padding,
    this.physics,
    required this.primary,
    this.restorationId,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  });

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final Clip clipBehavior;
  final ScrollController? controller;
  final DragStartBehavior dragStartBehavior;
  final ChildIndexGetter? findChildIndexCallback;
  final SliverGridDelegate gridDelegate;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool primary;
  final String? restorationId;
  final bool reverse;
  final Axis scrollDirection;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final children = this.children ?? const <JsonWidgetData>[];
    return GridView.builder(
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      findChildIndexCallback: findChildIndexCallback,
      gridDelegate: gridDelegate,
      itemCount: children.length,
      key: key,
      keyboardDismissBehavior: keyboardDismissBehavior,
      padding: padding,
      physics: physics,
      primary: primary,
      restorationId: restorationId,
      reverse: reverse,
      scrollDirection: scrollDirection,
      semanticChildCount: children.length,
      shrinkWrap: shrinkWrap,
      itemBuilder: (BuildContext context, int index) {
        final w = children[index].build(
          childBuilder: childBuilder,
          context: context,
        );
        return w;
      },
    );
  }
}
