import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class JsonWidgetData extends JsonClass {
  JsonWidgetData({
    dynamic args,
    required this.builder,
    JsonWidgetData? child,
    List<JsonWidgetData>? children,
    Set<String>? dynamicKeys,
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
        dynamicKeys = dynamicKeys ?? <String>{},
        id = id ?? Uuid().v4(),
        registry = registry ?? JsonWidgetRegistry.instance;

  static final Logger _logger = Logger('JsonWidgetData');

  final dynamic args;
  final JsonWidgetBuilder Function() builder;
  final List<JsonWidgetData>? children;
  final Set<String> dynamicKeys;
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
  /// ```json
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

    if (map is JsonWidgetData) {
      result = map;
    } else if (map is String &&
        (map.startsWith('!{{') || map.startsWith('{{')) &&
        map.endsWith('}}')) {
      var key = map.substring(map.indexOf('{{') + 2, map.length - 2).trim();
      result = DeferredJsonWidgetData(
        key: key,
        registry: registry,
      );
    } else if (map != null) {
      var type = map['type'];
      var builder = registry.getWidgetBuilder(type);
      var args = map['args'];

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

        map['args'].remove('body');
      }

      var dynamicParamsResult =
          registry.processDynamicArgs(args ?? <String, dynamic>{});

      try {
        result = JsonWidgetData(
          args: map['args'] ?? {},
          builder: () {
            return builder(
              registry!.processDynamicArgs(args ?? <String, dynamic>{}).values,
              registry: registry,
            )!;
          },
          child: child,
          children: map['children'] is String
              ? registry.processDynamicArgs(map['children']).values
              : JsonClass.fromDynamicList(
                  map['children'],
                  (dynamic map) => JsonWidgetData.fromDynamic(
                    map,
                    registry: registry,
                  )!,
                ),
          dynamicKeys: dynamicParamsResult.dynamicKeys,
          id: map['id'],
          originalChild: map['child'],
          originalChildren: map['children'],
          registry: registry,
          type: type,
        );
      } catch (e, stack) {
        if (e is _HandledJsonWidgetException) {
          rethrow;
        }
        _logger.severe('Error parsing data:\n$map', e, stack);
        throw _HandledJsonWidgetException(e, stack);
      }
    }

    return result;
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
    Set<String>? dynamicKeys,
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
        dynamicKeys: dynamicKeys ?? this.dynamicKeys,
        id: id ?? this.id,
        originalChild: originalChild ?? this.originalChild,
        originalChildren: originalChildren ?? this.originalChildren,
        registry: registry ?? this.registry,
        type: type ?? this.type,
      );

  /// Recreates the data object based on the updated values and function
  /// responces from the registry.  This should only be called within the
  /// framework itself, external code should not need to call this.
  JsonWidgetData recreate() {
    var builder = registry.getWidgetBuilder(type);
    var dynamicParamsResult = registry.processDynamicArgs(args);

    List<JsonWidgetData>? children;

    if (originalChild is String) {
      var values = registry.processDynamicArgs(originalChild).values;
      if (values is List) {
        children = List<JsonWidgetData>.from(values);
      } else {
        children = <JsonWidgetData>[values];
      }
    } else if (originalChildren is String) {
      var values = registry.processDynamicArgs(originalChildren).values;
      if (values is List) {
        children = List<JsonWidgetData>.from(values);
      } else {
        children = <JsonWidgetData>[values];
      }
    } else {
      children = this.children;
    }

    return JsonWidgetData(
      args: args,
      builder: () {
        return builder(
          registry.processDynamicArgs(args ?? <String, dynamic>{}).values,
          registry: registry,
        )!;
      },
      children: children?.map((child) => child.recreate()).toList(),
      dynamicKeys: dynamicParamsResult.dynamicKeys,
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

@immutable
class _HandledJsonWidgetException implements Exception {
  _HandledJsonWidgetException(this.e, this.stack);

  final dynamic e;
  final StackTrace stack;
}
