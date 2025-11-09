import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// A [JsonWidgetData] subclass that does not parse the JSON until the values
/// are needed.  This is used internally by the library for when widgets are
/// requested through a variable reference because the variable often won't
/// exist until after the first pass of the widget tree processing is completed.
class DeferredJsonWidgetData implements JsonWidgetData {
  DeferredJsonWidgetData({
    required String key,
    required JsonWidgetRegistry registry,
  }) : _key = key,
       _registry = registry;

  final String _key;
  final JsonWidgetRegistry _registry;

  JsonWidgetData? _data;

  @override
  bool get hasProvidedId => data.hasProvidedId;

  @override
  JsonWidgetBuilder? get jsonWidgetArgs => data.jsonWidgetArgs;

  @override
  JsonWidgetBuilder Function() get jsonWidgetBuilder => data.jsonWidgetBuilder;

  JsonWidgetData get data {
    var data = _data;
    if (data == null) {
      var temp = _registry.processArgs(_key, null).value;

      if (temp is! JsonWidgetData) {
        temp = JsonWidgetData.maybeFromDynamic(
          temp,
          registry: jsonWidgetRegistry,
        );
      }
      if (temp is! JsonWidgetData) {
        throw Exception(
          'Unable to find JsonWidgetData via [$_key] on the registry',
        );
      }

      data = temp.copyWith(jsonWidgetRegistry: jsonWidgetRegistry);
      _data = data;
    }
    return data;
  }

  @override
  Set<String> get jsonWidgetListenVariables => data.jsonWidgetListenVariables;

  @override
  String get jsonWidgetId => data.jsonWidgetId;

  @override
  Widget build({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    JsonWidgetRegistry? registry,
  }) => data.build(
    childBuilder: childBuilder,
    context: context,
    // Always ignore the passed in registry.  This is deferred explicitly
    // because an ancestor widget or function wanted to pass down a custom
    // registry to the children.
    registry: jsonWidgetRegistry,
  );

  @override
  JsonWidgetData copyWith({
    dynamic jsonWidgetArgs,
    JsonWidgetBuilder? jsonWidgetBuilder,
    Set<String>? jsonWidgetListenVariables,
    String? jsonWidgetId,
    JsonWidgetRegistry? jsonWidgetRegistry,
    String? jsonWidgetType,
  }) => JsonWidgetData(
    hasProvidedId: hasProvidedId,
    jsonWidgetArgs: jsonWidgetArgs ?? this.jsonWidgetArgs,
    jsonWidgetBuilder:
        jsonWidgetBuilder as JsonWidgetBuilder Function()? ??
        this.jsonWidgetBuilder,
    jsonWidgetListenVariables:
        jsonWidgetListenVariables ?? this.jsonWidgetListenVariables,
    jsonWidgetId: jsonWidgetId ?? this.jsonWidgetId,
    jsonWidgetRegistry: jsonWidgetRegistry ?? this.jsonWidgetRegistry,
    jsonWidgetType: jsonWidgetType ?? this.jsonWidgetType,
  );

  @override
  JsonWidgetRegistry get jsonWidgetRegistry => _registry;

  @override
  Map<String, dynamic> toJson() => data.toJson();

  @override
  String get jsonWidgetType => data.jsonWidgetType;
}
