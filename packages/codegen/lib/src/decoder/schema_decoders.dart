import 'dart:convert';

import 'package:json_dynamic_widget_codegen/src/model/param.dart';
import 'package:json_theme/codegen.dart';

typedef ParameterSchemaDecoder = String Function(Param element);

const _kNumberArraySchema = {
  'anyOf': [
    {'type': 'string'},
    {
      'type': 'array',
      'items': {'type': 'number'},
    },
  ],
};

final kSchemaDecoders = <String, ParameterSchemaDecoder>{
  'bool': (element) => 'SchemaHelper.boolSchema',
  'double': (element) => 'SchemaHelper.numberSchema',
  'int': (element) => 'SchemaHelper.numberSchema',
  'List<double>': (element) => json.encode(_kNumberArraySchema),
  'List<int>': (element) => json.encode(_kNumberArraySchema),
  'List<JsonWidgetData>': (element) =>
      'SchemaHelper.arraySchema(JsonWidgetDataSchema.id)',
  'List<PreferredSizeWidget>': (element) =>
      'SchemaHelper.arraySchema(JsonWidgetDataSchema.id)',
  'List<Widget>': (element) =>
      'SchemaHelper.arraySchema(JsonWidgetDataSchema.id)',
  'JsonWidgetData': (element) =>
      'SchemaHelper.objectSchema(JsonWidgetDataSchema.id)',
  'PreferredSizeWidget': (element) =>
      'SchemaHelper.objectSchema(JsonWidgetDataSchema.id)',
  'String': (element) => 'SchemaHelper.stringSchema',
  'Widget': (element) => 'SchemaHelper.objectSchema(JsonWidgetDataSchema.id)',
  ...kThemeDecoders.map(
    (key, value) => MapEntry<String, ParameterSchemaDecoder>(
      key,
      (element) =>
          'SchemaHelper.objectSchema(${key.replaceAll('<', '').replaceAll('>', '')}Schema.id)',
    ),
  ),
};
