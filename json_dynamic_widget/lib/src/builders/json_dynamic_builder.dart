import 'dart:async';
import 'dart:convert';

import 'package:interpolation/interpolation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
  const JsonDynamicBuilder({
    required super.args,
    required this.childTemplate,
    required this.builderType,
    required this.initState,
    this.registry,
  });

  static const kType = 'dynamic';
  final String builderType;

  final String childTemplate;
  final Iterable<Map<String, dynamic>> initState;
  final JsonWidgetRegistry? registry;

  @override
  String get type => kType;

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
  ///  * [JsonDynamicBuilder.maybeFromDynamic]
  ///  * [JsonWidgetData.fromDynamic]
  static JsonDynamicBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(
      map,
      registry: registry,
    );

    if (result == null) {
      throw Exception(
        '[JsonDynamicBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

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
  static JsonDynamicBuilder? maybeFromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonDynamicBuilder? result;
    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      registry ??= JsonWidgetRegistry.instance;
      map = registry.processArgs(map, <String>{}).value;
      
      final dynamicArgs = map['dynamic'];
      if (dynamicArgs != null && dynamicArgs['builderType'] != null) {
        result = JsonDynamicBuilder(
          args: map,
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

  @override
  JsonWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) =>
      throw UnsupportedError(
        'The dynamic widget is too complex to support auto-encoding',
      );

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final args = Map.from(data.jsonWidgetArgs);
    args.remove('dynamic');
    args['children'] = [];
    final map = {
      'id': data.jsonWidgetId,
      'type': builderType,
      'args': args,
    };

    if (data.jsonWidgetRegistry.getValue(data.jsonWidgetId) == null) {
      data.jsonWidgetRegistry.setValue(
        data.jsonWidgetId,
        initState
            .map(
              (values) => DynamicValuesFactory.create(values),
            )
            .toList(),
      );
    }

    return _DynamicWidget(
      data: JsonWidgetData.fromDynamic(map, registry: data.jsonWidgetRegistry),
      childTemplate: childTemplate,
      childBuilder: childBuilder,
      key: key,
    );
  }
}

class _DynamicWidget extends StatefulWidget {
  const _DynamicWidget({
    this.childBuilder,
    required this.childTemplate,
    required this.data,
    super.key,
  });

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
  void initState() {
    super.initState();

    _data = widget.data;
    _data.jsonWidgetArgs['children'] = _getChildrenData();
    _subscription = widget.data.jsonWidgetRegistry.valueStream.listen(
      _handleSubscription,
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    if (widget.data.jsonWidgetId.isNotEmpty == true) {
      widget.data.jsonWidgetRegistry.removeValue(widget.data.jsonWidgetId);
    }
    super.dispose();
  }

  void _handleSubscription(WidgetValueChanged event) {
    if (event.id == widget.data.jsonWidgetId &&
        event.originator != widget.data.jsonWidgetId) {
      if (mounted == true) {
        setState(() {
          _data.jsonWidgetArgs['children'] = _getChildrenData();
        });
      }
    }
  }

  List<JsonWidgetData> _getChildrenData() {
    final List<dynamic> childrenValues =
        widget.data.jsonWidgetRegistry.getValue(widget.data.jsonWidgetId) ?? [];
    final newChildren = <JsonWidgetData>[];
    if (childrenValues.isNotEmpty) {
      childrenValues
          .map(
            (values) => Interpolation().eval(widget.childTemplate, values),
          )
          .map(
            (childJson) => JsonWidgetData.fromDynamic(
              json.decode(childJson),
              registry: widget.data.jsonWidgetRegistry,
            ),
          )
          .forEach((childWidgetData) => newChildren.add(childWidgetData));
    }
    return newChildren;
  }

  @override
  Widget build(BuildContext context) {
    return widget.data.build(
      context: context,
      childBuilder: widget.childBuilder,
      registry: widget.data.jsonWidgetRegistry,
    );
  }
}

class DynamicSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dynamic.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$children': -1,
    'title': 'Dynamic',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': true,
        'properties': {
          'dynamic': {
            'type': 'object',
            'additionalProperties': false,
            'properties': {
              'builderType': SchemaHelper.stringSchema,
              'childTemplate': {
                'type': 'object',
                'additionalProperties': true,
              },
              'initState': {
                'oneOf': [
                  {
                    'type': 'null',
                  },
                  {
                    'type': 'array',
                    'items': {
                      'type': 'object',
                      'additionalProperties': true,
                    }
                  }
                ]
              }
            }
          }
        },
      }
    ],
  };
}
