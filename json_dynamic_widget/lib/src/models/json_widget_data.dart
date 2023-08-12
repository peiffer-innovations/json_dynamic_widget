import 'dart:convert';

import 'package:execution_timer/execution_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

class JsonWidgetData extends JsonClass {
  JsonWidgetData({
    this.args,
    required this.builder,
    Set<String>? listenVariables,
    String? id,
    JsonWidgetRegistry? registry,
    required this.type,
  })  : listenVariables = listenVariables ?? <String>{},
        id = id ?? const Uuid().v4(),
        registry = registry ?? JsonWidgetRegistry.instance;

  static final Logger _logger = Logger('JsonWidgetData');

  final dynamic args;
  final JsonWidgetBuilder Function() builder;
  final Set<String> listenVariables;
  final String id;
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
  static JsonWidgetData fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, registry: registry);
    if (result == null) {
      throw Exception(
        '[JsonWidgetData]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static List<JsonWidgetData> fromDynamicList(
    dynamic list, {
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamicList(list);
    if (result == null) {
      throw Exception(
        '[JsonWidgetData]: requested to parse from dynamic list, but the input is null.',
      );
    }

    return result;
  }

  /// Decodes a JSON object into a dynamic widget.  The structure is the same
  /// for all dynamic widgets with the exception of the `args` value.  The
  /// `args` depends on the specific `type`.
  ///
  /// {
  ///   "type": <String>,
  ///   "args": <dynamic>,
  ///   "id": <String>
  /// }
  /// ```
  static JsonWidgetData? maybeFromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonWidgetData? result;
    registry ??= JsonWidgetRegistry.instance;

    if (map is JsonWidgetData) {
      result = map;
    } else if (map != null) {
      try {
        final type = map['type'];
        final timer = ExecutionWatch(
          group: 'JsonWidgetData.fromDynamic',
          name: type,
        ).start();
        try {
          if (type is! String) {
            throw HandledJsonWidgetException(
              'Unknown type encountered: [$type]',
              data: map,
            );
          }
          final builder = registry.getWidgetBuilder(type);
          final args = map['args'] as Map? ?? const {};
          final listenVariables = _getListenVariables(map);

          // The validation needs to happen before we process the dynamic args
          // orelse there may be non-JSON compatible objects in the map which
          // will always fail validation.
          if (kDebugMode) {
            registry.validateBuilderSchema(
              type: type,
              value: args,
              validate: map.containsKey('args') ? true : false,
            );
          }

          result = JsonWidgetData(
            args: map['args'] ?? {},
            builder: () {
              return builder(
                args,
                registry: registry,
              );
            },
            listenVariables: listenVariables,
            id: map['id'],
            registry: registry,
            type: type,
          );
        } finally {
          timer.stop();
        }
      } catch (e, stack) {
        if (e is HandledJsonWidgetException) {
          rethrow;
        }
        var errorValue = map;
        if (errorValue is Map || errorValue is List) {
          errorValue = const JsonEncoder.withIndent('  ').convert(errorValue);
        }
        if (e is AssertionError) {
          throw HandledJsonWidgetException(
            e,
            data: errorValue,
          );
        } else {
          _logger.severe(
            '''
*** WIDGET PARSE ERROR ***
$errorValue
''',
            e,
            stack,
          );
        }
        throw HandledJsonWidgetException(
          e,
          data: errorValue,
          stackTrace: stack,
        );
      }
    }

    return result;
  }

  /// Returns a parsed list from a dynamic [Iterable].  If the passed in [list]
  /// is `null` then this will return `null`.
  static List<JsonWidgetData>? maybeFromDynamicList(
    dynamic list, {
    JsonWidgetRegistry? registry,
  }) {
    List<JsonWidgetData>? result;

    if (list != null) {
      if (list is! Iterable) {
        throw Exception(
          '[JsonWidgetData] An unsupported type was passed in to "maybeFromDynamic": ${list.runtimeType}.',
        );
      }

      result = <JsonWidgetData>[];
      for (var map in list) {
        result.add(fromDynamic(
          map,
          registry: registry,
        ));
      }
    }

    return result;
  }

  /// Get listen variables directly from [map].
  /// Changing the value of listen variables is causing [JsonWidgetData] to be
  /// rebuilt. Defining them in [map] is also stopping [ArgProcessor] from
  /// calculating the listen variables during processing.
  static Set<String> _getListenVariables(dynamic map) {
    final listenVariables = <String>{};

    final listen = map?['listen'];
    if (listen is Iterable) {
      listenVariables.addAll(List<String>.from(listen));
    }
    return listenVariables;
  }

  /// Convenience method that can build the widget this data object represents.
  /// This is the equilivant of calling: [builder.build] and passing this in as
  /// the [data] parameter.
  Widget build({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    JsonWidgetRegistry? registry,
  }) {
    return builder().build(
      childBuilder: childBuilder,
      context: context,
      data: copyWith(registry: registry),
    );
  }

  JsonWidgetData copyWith({
    dynamic args,
    JsonWidgetBuilder? builder,
    Set<String>? listenVariables,
    String? id,
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
  Map<String, dynamic> toJson() => JsonClass.removeNull({
        'type': type,
        'id': id,
        'args': args,
      });
}
