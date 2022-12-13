import 'dart:async';
import 'dart:convert';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:interpolation/interpolation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:uuid/uuid.dart';

/// Creates values used to parameterize child templates.
/// It generates 'id' field if not exist via [Uuid.v4].
class DynamicValuesFactory {
  static Map<String, dynamic> create(dynamic valuesRaw) {
    final values = Map<String, dynamic>.from(valuesRaw);
    values['id'] ??= const Uuid().v4().replaceAll('-', '_');
    return values;
  }
}

/// Builder that builds children based on the state the listened value.
/// Listened value name is equal to `id` field value.
/// Children are created from `childTemplate` with usage of `${dynamic}`
/// function. `childTemplate` is able to use template values via {} format.
/// For example to use an `id` value in a template just putting there `{id}`
/// is enough. Templating mechanism uses [Interpolation] underneath.
///
/// See the [fromDynamic] for the format.
class JsonDynamicBuilder extends JsonWidgetBuilder {
  JsonDynamicBuilder({
    required this.childTemplate,
    required this.builderType,
    required this.initState,
    this.registry,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;

  static const type = 'dynamic';
  final String builderType;

  final String childTemplate;
  final Iterable<Map<String, dynamic>> initState;
  final JsonWidgetRegistry? registry;

  /// Builds the builder from a Map-like dynamic structure. This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dynamic" : {
  ///     "builderType": "<String>",
  ///     "childTemplate": "<Object>",
  ///     "initState": "<List>"
  ///   }
  /// }
  /// ```
  ///
  ///
  /// See also:
  ///  * [JsonDynamicBuilder.fromDynamic]
  ///  * [JsonWidgetData.fromDynamic]
  static JsonDynamicBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonDynamicBuilder? result;
    if (map != null) {
      final dynamicArgs = map['dynamic'];
      if (dynamicArgs != null && dynamicArgs['builderType'] != null) {
        result = JsonDynamicBuilder(
          childTemplate: json.encode(dynamicArgs['childTemplate'] ?? {}),
          builderType: dynamicArgs['builderType'],
          initState: List.from(dynamicArgs['initState'] ?? []).map(
            (values) => Map<String, dynamic>.from(values),
          ),
        );
      }
    }
    return result;
  }

  /// Removes any / all values this builder may have set from the
  /// [JsonWidgetRegistry].
  @override
  void remove(JsonWidgetData data) {
    if (data.id.isNotEmpty == true) {
      data.registry.removeValue(data.id);
    }

    super.remove(data);
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final args = Map.from(data.args);
    args.remove('dynamic');
    final map = {
      'id': data.id,
      'type': builderType,
      'args': args,
      'children': List.empty(),
    };

    if (data.registry.getValue(data.id) == null) {
      data.registry.setValue(
        data.id,
        initState
            .map(
              (values) => DynamicValuesFactory.create(values),
            )
            .toList(),
      );
    }

    return _DynamicWidget(
      data: JsonWidgetData.fromDynamic(map, registry: data.registry)!,
      childTemplate: childTemplate,
      childBuilder: childBuilder,
      key: key,
    );
  }
}

class _DynamicWidget extends StatefulWidget {
  _DynamicWidget({
    this.childBuilder,
    required this.childTemplate,
    required this.data,
    Key? key,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
  final String childTemplate;
  final JsonWidgetData data;

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<_DynamicWidget> {
  late JsonWidgetData _data;
  late StreamSubscription<WidgetValueChanged>? _subscription;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> childrenData = _data.registry.getValue(_data.id) ?? [];
    if (childrenData.isEmpty) {
      _data.children!.clear();
    } else {
      _data.children!.clear();
      final children = childrenData
          .map(
            (e) => Interpolation().eval(widget.childTemplate, e),
          )
          .map(
            (e) => JsonWidgetData.fromDynamic(
              json.decode(e),
              registry: widget.data.registry,
            )!,
          );
      _data.children!.addAll(children);
    }

    return _data.build(context: context, childBuilder: widget.childBuilder);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _data = widget.data;
    _subscription = widget.data.registry.valueStream.listen(
      _handleSubscription,
    );
  }

  void _handleSubscription(WidgetValueChanged event) {
    if (event.id == _data.id && event.originator != _data.id) {
      _data = _data.recreate(_data.registry);
      if (mounted == true) {
        setState(() {});
      }
    }
  }
}
