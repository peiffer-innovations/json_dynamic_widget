// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_list_view_builder.g.dart';

/// Builder that can build an [ListView] widget.
@jsonWidget
abstract class _JsonListViewBuilder extends JsonWidgetBuilder {
  const _JsonListViewBuilder({
    required super.args,
  });

  @override
  _ListView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _ListView extends StatelessWidget {
  const _ListView({
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    @JsonBuildArg() this.childBuilder,
    this.children,
    this.clipBehavior = Clip.hardEdge,
    this.controller,
    @JsonBuildArg() required this.data,
    this.dragStartBehavior = DragStartBehavior.start,
    this.findChildIndexCallback,
    this.itemExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    @JsonBuildArg() required this.model,
    this.padding,
    this.physics,
    this.primary,
    this.prototypeItem,
    this.restorationId,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  });

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final Clip clipBehavior;
  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final ScrollController? controller;
  final JsonWidgetData data;
  final DragStartBehavior dragStartBehavior;
  final ChildIndexGetter? findChildIndexCallback;
  final double? itemExtent;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final JsonListViewBuilderModel model;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool? primary;
  final JsonWidgetData? prototypeItem;
  final String? restorationId;
  final bool reverse;
  final Axis scrollDirection;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final children = this.children ?? const <JsonWidgetData>[];

    return ListView.builder(
      addAutomaticKeepAlives: model.addAutomaticKeepAlives,
      addRepaintBoundaries: model.addRepaintBoundaries,
      addSemanticIndexes: model.addSemanticIndexes,
      cacheExtent: model.cacheExtent,
      clipBehavior: model.clipBehavior,
      controller: model.controller,
      dragStartBehavior: model.dragStartBehavior,
      findChildIndexCallback: findChildIndexCallback ??
          (key) {
            int? result;

            if (key is ValueKey) {
              final value = key.value?.toString();

              if (value != null) {
                for (var i = 0; i < children.length; i++) {
                  final child = children[i];
                  if (child.jsonWidgetId == value) {
                    result = i;
                    break;
                  }
                }
              }
            }

            return result;
          },
      itemBuilder: (BuildContext context, int index) {
        final w = children[index].build(
          childBuilder: childBuilder,
          context: context,
        );
        return w;
      },
      itemCount: children.length,
      itemExtent: model.itemExtent,
      key: key,
      keyboardDismissBehavior: model.keyboardDismissBehavior,
      padding: model.padding,
      physics: model.physics,
      primary: model.primary,
      prototypeItem: model.prototypeItem?.build(
        context: context,
        childBuilder: childBuilder,
        registry: data.jsonWidgetRegistry,
      ),
      restorationId: model.restorationId,
      reverse: model.reverse,
      scrollDirection: model.scrollDirection,
      semanticChildCount: children.length,
      shrinkWrap: model.shrinkWrap,
    );
  }
}
