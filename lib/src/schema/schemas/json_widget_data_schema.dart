import 'package:json_theme/json_theme_schemas.dart';

class JsonWidgetDataSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/json_widget_data.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
          'args': {
            'type': 'object',
            'additionalProperties': true,
          },
          'child': SchemaHelper.anySchema,
          'children': {
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
          'id': {
            'type': 'string',
          },
          'type': {
            'type': 'string',
          },
          'listen': {
            'type': 'array',
            'items': SchemaHelper.stringSchema,
          },
        },
      },
    ],
  };
}
