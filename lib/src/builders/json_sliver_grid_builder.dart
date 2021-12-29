import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [SliverGrid] widget.  See the [fromDynamic] for
/// the format.
class JsonSliverGridBuilder extends JsonWidgetBuilder {
  JsonSliverGridBuilder({
    required this.addAutomaticKeepAlives,
    required this.addRepaintBoundaries,
    required this.addSemanticIndexes,
    this.findChildIndexCallback,
    this.gridDelegate,
    this.semanticIndexCallback,
    required this.semanticIndexOffset,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'sliver_grid';

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final ChildIndexGetter? findChildIndexCallback;
  final dynamic gridDelegate;
  final SemanticIndexCallback? semanticIndexCallback;
  final int semanticIndexOffset;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "addAutomaticKeepAlives": <bool>,
  ///   "addRepaintBoundaries": <bool>,
  ///   "addSemanticIndexes": <bool>,
  ///   "findChildIndexCallback": <ChildIndexGetter>,
  ///   "gridDelegate": <SliverGridDelegate>,
  ///   "semanticIndexCallback": <SemanticIndexCallback>,
  ///   "semanticIndexOffset": <int>
  /// }
  /// ```
  ///
  /// As a note, the [ScrollController] cannot be decoded via JSON.  Instead,
  /// the only way to bind those values to the builder is to use a function or a
  /// variable reference via the [JsonWidgetRegistry].
  static JsonSliverGridBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSliverGridBuilder? result;

    if (map != null) {
      result = JsonSliverGridBuilder(
        addAutomaticKeepAlives: JsonClass.parseBool(
          map['addAutomaticKeepAlives'],
          whenNull: true,
        ),
        addRepaintBoundaries: JsonClass.parseBool(
          map['addRepaintBoundaries'],
          whenNull: true,
        ),
        addSemanticIndexes: JsonClass.parseBool(
          map['addSemanticIndexes'],
          whenNull: true,
        ),
        findChildIndexCallback: map['findChildIndexCallback'],
        gridDelegate: map['gridDelegate'],
        semanticIndexCallback: map['semanticIndexCallback'],
        semanticIndexOffset:
            JsonClass.parseInt(map['semanticIndexOffset']) ?? 0,
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
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => data.children![index].build(
          context: context,
          childBuilder: childBuilder,
        ),
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        childCount: data.children?.length ?? 0,
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
