import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:meta/meta.dart';

class JsonWidgetData extends JsonClass {
  JsonWidgetData({
    @required this.builder,
    JsonWidgetData child,
    List<JsonWidgetData> children,
    this.id,
    this.registry,
    @required this.type,
  })  : assert(builder != null),
        assert(
          child == null || children?.isNotEmpty != true,
          'A JsonWidgetData may either contain a [child] or an array of [children], but not both.',
        ),
        assert(type != null),
        children = children ?? child == null ? null : [child];

  final JsonWidgetBuilder builder;
  final List<JsonWidgetData> children;
  final String id;
  final JsonWidgetRegistry registry;
  final String type;

  static JsonWidgetData fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonWidgetData result;
    if (map != null) {
      registry ??= JsonWidgetRegistry.instance;

      var type = map['type'];
      var builder = registry.getWidgetBuilder(type);
      result = JsonWidgetData(
        builder: builder(registry.processDynamicArgs(map['args'] ?? {})),
        child: JsonWidgetData.fromDynamic(map['child']),
        children: JsonClass.fromDynamicList(
          map['children'],
          JsonWidgetData.fromDynamic,
        ),
        id: map['id'],
        registry: registry,
        type: type,
      );
    }

    return result;
  }

  /// Convenience method that can build the widget this data object represents.
  /// This is the equilivant of calling: [builder.build] and padding this in as
  /// the [data] parameter.
  Widget build({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
  }) {
    assert(context != null);

    return builder.build(
      childBuilder: childBuilder,
      context: context,
      data: this,
    );
  }

  @override
  Map<String, dynamic> toJson() => JsonClass.removeNull({
        'child': children?.length == 1 ? children[0].toJson() : null,
        'children': JsonClass.toJsonList(children),
        'id': id,
        'type': type,
      });
}
