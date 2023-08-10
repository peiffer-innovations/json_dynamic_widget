import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sliver_grid_builder.g.dart';

/// Builder that can build an [SliverGrid] widget.
@jsonWidget
abstract class _JsonSliverGridBuilder extends JsonWidgetBuilder {
  const _JsonSliverGridBuilder();

  @override
  _SliverGrid buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _SliverGrid extends StatelessWidget {
  const _SliverGrid({
    required this.addAutomaticKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    @JsonBuildArg() this.childBuilder,
    this.children,
    @JsonBuildArg() required this.data,
    this.findChildIndexCallback,
    this.gridDelegate,
    this.semanticIndexCallback,
    required this.semanticIndexOffset,
  });

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final JsonWidgetData data;
  final ChildIndexGetter? findChildIndexCallback;
  final dynamic gridDelegate;
  final SemanticIndexCallback? semanticIndexCallback;
  final int semanticIndexOffset;

  @override
  Widget build(BuildContext context) {
    final children = this.children ?? const <JsonWidgetData>[];
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => children[index].build(
          context: context,
          childBuilder: childBuilder,
          registry: data.registry,
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
      gridDelegate: SliverGridDelegateDecoder.decodeGridDelegate(
        gridDelegate: gridDelegate,
      ),
      key: key,
    );
  }
}
