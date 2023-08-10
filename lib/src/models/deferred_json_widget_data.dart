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

  // @override
  // List<JsonWidgetData>? get children => data.children;

  JsonWidgetData get data {
    var data = _data;
    if (data == null) {
      var temp = _registry.processArgs(_key, null).value;

      if (temp is! JsonWidgetData) {
        temp = JsonWidgetData.maybeFromDynamic(
          temp,
          registry: registry,
        );
      }
      if (temp is! JsonWidgetData) {
        throw Exception(
          'Unable to find JsonWidgetData via [$_key] on the registry',
        );
      }

      data = temp.copyWith(registry: registry);
      _data = data;
    }
    return data;
  }

  @override
  Set<String> get listenVariables => data.listenVariables;

  @override
  String get id => data.id;

  @override
  Widget build({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    JsonWidgetRegistry? registry,
  }) =>
      data.build(
        childBuilder: childBuilder,
        context: context,
        registry: registry ?? this.registry,
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
        listenVariables: listenVariables ?? this.listenVariables,
        id: id ?? this.id,
        registry: registry ?? this.registry,
        type: type ?? this.type,
      );

  @override
  JsonWidgetRegistry get registry => _registry;

  @override
  Map<String, dynamic> toJson() => data.toJson();

  @override
  String get type => data.type;
}
