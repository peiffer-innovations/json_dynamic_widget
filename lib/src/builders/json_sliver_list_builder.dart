import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sliver_list_builder.g.dart';

/// Builder that can build an [SliverList] widget.
@jsonWidget
abstract class _JsonSliverListBuilder extends JsonWidgetBuilder {
  const _JsonSliverListBuilder({
    required super.numSupportedChildren,
  });

  @override
  _SliverList buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SliverList extends StatelessWidget {
  const _SliverList({
    required this.addAutomaticKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    this.childBuilder,
    required this.data,
    this.findChildIndexCallback,
    this.semanticIndexCallback,
    required this.semanticIndexOffset,
  });

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final ChildIndexGetter? findChildIndexCallback;
  final SemanticIndexCallback? semanticIndexCallback;
  final int semanticIndexOffset;

  @override
  Widget build(BuildContext context) {
    final children = data.children ?? const <JsonWidgetData>[];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => children[index].build(
          context: context,
          childBuilder: childBuilder,
        ),
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        childCount: children.length,
        findChildIndexCallback: findChildIndexCallback,
        semanticIndexCallback:
            semanticIndexCallback ?? (Widget _, int localIndex) => localIndex,
        semanticIndexOffset: semanticIndexOffset,
      ),
      key: key,
    );
  }
}
