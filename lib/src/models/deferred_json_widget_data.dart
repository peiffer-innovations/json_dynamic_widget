import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// A [JsonWidgetData] subclass that does not parse the JSON until the values
/// are needed.  This is used internally by the library for when widgets are
/// requested through a variable reference because the variable often won't
/// exist until after the first pass of the widget tree processing is completed.
class DeferredJsonWidgetData implements JsonWidgetData {
  DeferredJsonWidgetData({
    required String key,
    required JsonWidgetRegistry registry,
  })  : _key = key,
        _registry = registry;

  final String _key;
  final JsonWidgetRegistry _registry;

  JsonWidgetData? _data;

  @override
  JsonWidgetBuilder? get args => data.args;

  @override
  JsonWidgetBuilder Function() get builder => data.builder;

  @override
  List<JsonWidgetData>? get children => data.children;

  JsonWidgetData get data {
    if (_data == null) {
      var data = _registry.processArgs(_key, null).value;

      if (data is! JsonWidgetData) {
        data = JsonWidgetData.fromDynamic(
          data,
          registry: registry,
        );
      }
      if (data is! JsonWidgetData) {
        throw Exception(
          'Unable to find JsonWidgetData via [$_key] on the registry',
        );
      }

      // It's an error for two exact JsonWidgetData objects to be in two places
      // on the tree.  To avoid that, we recreate the data object to effectively
      // clone it so it's a copy that gets placed on the tree and not the exact
      // widget.  Plus, this way the widget picks up any current dynamic values
      // rather than the outdated ones it might have been set up with.
      _data = data.recreate(registry);
    }
    return _data!;
  }

  @override
  Set<String> get listenVariables => data.listenVariables;

  @override
  String get id => data.id;

  @override
  dynamic get originalChild => data.originalChild;

  @override
  dynamic get originalChildren => data.originalChildren;

  @override
  Widget build({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
  }) =>
      data.build(
        childBuilder: childBuilder,
        context: context,
      );

  @override
  JsonWidgetData copyWith({
    dynamic args,
    JsonWidgetBuilder? builder,
    List<JsonWidgetData>? children,
    Set<String>? listenVariables,
    String? id,
    dynamic originalChild,
    dynamic originalChildren,
    JsonWidgetRegistry? registry,
    String? type,
  }) =>
      JsonWidgetData(
        args: args ?? this.args,
        builder: builder as JsonWidgetBuilder Function()? ?? this.builder,
        children: children ?? this.children,
        listenVariables: listenVariables ?? this.listenVariables,
        id: id ?? this.id,
        originalChild: originalChild ?? this.originalChild,
        originalChildren: originalChildren ?? this.originalChildren,
        registry: registry ?? this.registry,
        type: type ?? this.type,
      );

  @override
  JsonWidgetData recreate([JsonWidgetRegistry? newRegistry]) => data.recreate(
        registry,
      );

  @override
  JsonWidgetRegistry get registry => _registry;

  @override
  Map<String, dynamic> toJson() => data.toJson();

  @override
  String get type => data.type;
}
