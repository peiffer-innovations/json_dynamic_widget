import 'package:json_theme/json_theme_schemas.dart';

class JsonWidgetDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/json_widget_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/JsonWidgetData-class.html',
    'title': 'JsonWidgetData',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'type',
        ],
        'properties': {
          JsonWidgetDataSchemaProperty.args: {
            'type': 'object',
            'additionalProperties': true,
          },
          JsonWidgetDataSchemaProperty.child: SchemaHelper.anySchema,
          JsonWidgetDataSchemaProperty.children: {
            'anyOf': [
              {
                'type': 'string',
              },
              {
                'type': 'array',
                'items': SchemaHelper.anySchema,
              },
            ],
          },
          JsonWidgetDataSchemaProperty.id: {
            'type': 'string',
          },
          JsonWidgetDataSchemaProperty.type: {
            'type': 'string',
          },
          JsonWidgetDataSchemaProperty.listen: {
            'type': 'array',
            'items': SchemaHelper.stringSchema,
          },
        },
      },
    ],
  };
}

class JsonWidgetDataSchemaProperty {
  static const args = 'args';
  static const child = 'child';
  static const children = 'children';
  static const id = 'id';
  static const listen = 'listen';
  static const type = 'type';
}
