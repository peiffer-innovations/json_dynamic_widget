import 'package:json_theme/json_theme_schemas.dart';

class DynamicSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dynamic.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/JsonDynamicBuilder-class.html',
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
