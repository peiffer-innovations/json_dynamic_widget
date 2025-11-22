import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// A [JsonWidgetData] subclass that does not parse the JSON until the values
/// are needed.  This is used internally by the library for when widgets are
/// requested through a variable reference because the variable often won't
/// exist until after the first pass of the widget tree processing is completed.
class DeferredJsonWidgetData implements JsonWidgetData {
  DeferredJsonWidgetData({
    required dynamic key,
    required JsonWidgetRegistry registry,
    VoidCallback? onResolved,
  }) : _key = key,
       _registry = registry,
       _onResolved = onResolved;

  final dynamic _key;
  final JsonWidgetRegistry _registry;
  final VoidCallback? _onResolved;

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
      data = JsonWidgetData.fromDynamic(
        _key,
        registry: jsonWidgetRegistry
      );
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
  }) {
    final built = data.build(
      childBuilder: childBuilder,
      context: context,
      registry: jsonWidgetRegistry,
      // Always ignore the passed in registry.  This is deferred explicitly
      // because an ancestor widget or function wanted to pass down a custom
      // registry to the children.
    );

    final onResolved = _onResolved;
    if (onResolved == null) {
      return built;
    }

    if (built is PreferredSizeWidget) {
      return _PreferredSizeCleanupWidget(
        child: built,
        onDispose: onResolved,
      );
    }

    return _CleanupWidget(
      child: built,
      onDispose: onResolved,
    );
  }

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

class _CleanupWidget extends StatefulWidget {
  const _CleanupWidget({
    required this.child,
    required this.onDispose,
  });

  final Widget child;
  final VoidCallback onDispose;

  @override
  State<_CleanupWidget> createState() => _CleanupWidgetState();
}

class _CleanupWidgetState extends State<_CleanupWidget> {
  @override
  void dispose() {
    widget.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _PreferredSizeCleanupWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const _PreferredSizeCleanupWidget({
    required this.child,
    required this.onDispose,
  });

  final PreferredSizeWidget child;
  final VoidCallback onDispose;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  State<_PreferredSizeCleanupWidget> createState() =>
      _PreferredSizeCleanupWidgetState();
}

class _PreferredSizeCleanupWidgetState
    extends State<_PreferredSizeCleanupWidget> {
  @override
  void dispose() {
    widget.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
