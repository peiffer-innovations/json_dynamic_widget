import 'dart:convert';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

class JsonWidgetData extends JsonClass {
  JsonWidgetData({
    dynamic args,
    required this.builder,
    JsonWidgetData? child,
    List<JsonWidgetData>? children,
    Set<String>? listenVariables,
    String? id,
    this.originalChild,
    this.originalChildren,
    JsonWidgetRegistry? registry,
    required this.type,
  })  : assert(
          child == null || children?.isNotEmpty != true,
          'A JsonWidgetData may either contain a [child] or an array of [children], but not both.',
        ),
        args = args,
        children = children ?? (child == null ? null : [child]),
        listenVariables = listenVariables ?? <String>{},
        id = id ?? Uuid().v4(),
        registry = registry ?? JsonWidgetRegistry.instance;

  static final Logger _logger = Logger('JsonWidgetData');

  final dynamic args;
  final JsonWidgetBuilder Function() builder;
  final List<JsonWidgetData>? children;
  final Set<String> listenVariables;
  final String id;
  final dynamic originalChild;
  final dynamic originalChildren;
  final JsonWidgetRegistry registry;
  final String type;

  /// Decodes a JSON object into a dynamic widget.  The structure is the same
  /// for all dynamic widgets with the exception of the `args` value.  The
  /// `args` depends on the specific `type`.
  ///
  /// In the given JSON object, only the `child` or the `children` can be passed
  /// in; not both.  From an implementation perspective, there is no difference
  /// between passing in a `child` or a `children` with a single element, this
  /// will treat both of those identically.
  ///
  /// {
  ///   "type": <String>,
  ///   "args": <dynamic>,
  ///   "child": <JsonWidgetData>,
  ///   "children": <JsonWidgetData[]>,
  ///   "id": <String>
  /// }
  /// ```
  static JsonWidgetData? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonWidgetData? result;
    registry ??= JsonWidgetRegistry.instance;

    if (map is String && map.startsWith('{') && map.endsWith('}')) {
      try {
        map = json.decode(map);
      } catch (e) {
        // no-op; it probably just isn't a JSON string
      }
    }
    if (map is JsonWidgetData) {
      result = map;
    } else if (map is String && map.startsWith('\${') && map.endsWith('}')) {
      result = DeferredJsonWidgetData(
        key: map,
        registry: registry,
      );
    } else if (map != null) {
      try {
        var type = map['type'];
        if (type is! String) {
          throw HandledJsonWidgetException(
            'Unknown type encountered: [$type]',
            null,
            data: map,
          );
        }
        var builder = registry.getWidgetBuilder(type);
        var args = map['args'];
        var listenVariables = _getListenVariables(map);

        // The validation needs to happen before we process the dynamic args or
        // else there may be non-JSON compatible objects in the map which will
        // always fail validation.
        assert(registry.validateBuilderSchema(
          type: type,
          value: args,
          validate: args == null ? false : true,
        ));

        var child = JsonWidgetData.fromDynamic(
          map['child'],
          registry: registry,
        );
        if (type == 'scaffold' && map['args'] is Map && child == null) {
          child = JsonWidgetData.fromDynamic(
            map['args']['body'],
            registry: registry,
          );

          var args = Map<String, dynamic>.from(map['args']);
          args.remove('body');
          map['args'] = args;
        }

        var processedArgs =
            registry.processArgs(args ?? <String, dynamic>{}, listenVariables);

        result = JsonWidgetData(
          args: map['args'] ?? {},
          builder: () {
            return builder(
              registry!
                  .processArgs(args ?? <String, dynamic>{}, listenVariables)
                  .value,
              registry: registry,
            )!;
          },
          child: child,
          children: map['children'] is String
              ? registry.processArgs(map['children'], listenVariables).value
              : JsonClass.fromDynamicList(
                  map['children'],
                  (dynamic map) => JsonWidgetData.fromDynamic(
                    map,
                    registry: registry,
                  )!,
                ),
          listenVariables: processedArgs.listenVariables,
          id: map['id'],
          originalChild: map['child'],
          originalChildren: map['children'],
          registry: registry,
          type: type,
        );
      } catch (e, stack) {
        if (e is HandledJsonWidgetException) {
          rethrow;
        }
        var errorValue = map;
        if (errorValue is Map || errorValue is List) {
          errorValue = JsonEncoder.withIndent('  ').convert(errorValue);
        }
        _logger.severe('''
*** WIDGET PARSE ERROR ***
$errorValue

$map
''', e, stack);
        throw HandledJsonWidgetException(
          e,
          stack,
          data: errorValue,
        );
      }
    }

    return result;
  }

  /// Get listen variables directly from [map].
  /// Changing the value of listen variables is causing [JsonWidgetData] to be
  /// rebuilt. Defining them in [map] is also stopping [ArgProcessor] from
  /// calculating the listen variables during processing.
  static Set<String>? _getListenVariables(dynamic map) {
    Set<String>? listenVariables;
    if (map != null &&
        map['listen'] != null &&
        map['listen'] is Iterable<dynamic>) {
      listenVariables = Set<String>.from(map['listen']);
    }
    return listenVariables;
  }

  /// Convenience method that can build the widget this data object represents.
  /// This is the equilivant of calling: [builder.build] and padding this in as
  /// the [data] parameter.
  Widget build({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
  }) {
    return builder().build(
      childBuilder: childBuilder,
      context: context,
      data: this,
    );
  }

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

  /// Recreates the data object based on the updated values and function
  /// responces from the registry.  This should only be called within the
  /// framework itself, external code should not need to call this.
  JsonWidgetData recreate([JsonWidgetRegistry? newRegistry]) {
    var registry = newRegistry ?? this.registry;
    var builder = registry.getWidgetBuilder(type);
    var dynamicParamsResult = registry.processArgs(args, listenVariables);

    List<JsonWidgetData>? children;

    if (originalChild is String) {
      var values = registry.processArgs(originalChild, listenVariables).value;
      if (values is String) {
        try {
          values = json.decode(values);
        } catch (e) {
          // no-op
        }
      }
      if (values is List) {
        children = List<JsonWidgetData>.from(
          values.map(
            (e) => JsonWidgetData.fromDynamic(
              e,
              registry: registry,
            ),
          ),
        );
      } else {
        children = <JsonWidgetData>[
          JsonWidgetData.fromDynamic(
            values,
            registry: registry,
          )!
        ];
      }
    } else if (originalChildren is String) {
      var values =
          registry.processArgs(originalChildren, listenVariables).value;
      if (values is String) {
        try {
          values = json.decode(values);
        } catch (e) {
          // no-op
        }
      }
      if (values is List) {
        children = List<JsonWidgetData>.from(
          values.map(
            (e) => JsonWidgetData.fromDynamic(
              e,
              registry: registry,
            ),
          ),
        );
      } else {
        children = <JsonWidgetData>[
          JsonWidgetData.fromDynamic(
            values,
            registry: registry,
          )!
        ];
      }
    } else {
      children = this.children;
    }

    return JsonWidgetData(
      args: args,
      builder: () {
        return builder(
          registry
              .processArgs(args ?? <String, dynamic>{}, listenVariables)
              .value,
          registry: registry,
        )!;
      },
      children: children?.map((child) => child.recreate()).toList(),
      listenVariables: dynamicParamsResult.listenVariables,
      id: id,
      originalChild: originalChild,
      originalChildren: originalChildren,
      registry: registry,
      type: type,
    );
  }

  @override
  Map<String, dynamic> toJson() => JsonClass.removeNull({
        'type': type,
        'id': id,
        'args': args,
        'children': JsonClass.toJsonList(children),
      });
}
