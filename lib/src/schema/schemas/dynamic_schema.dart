import 'package:json_theme/json_theme_schemas.dart';

class DynamicSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dynamic.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
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
          DynamicSchemaProperty.dynamic: {
            'type': 'object',
            'additionalProperties': false,
            'properties': {
              DynamicSchemaProperty.dynamicBuilderType: SchemaHelper.stringSchema,
              DynamicSchemaProperty.dynamicChildTemplate: {
                'type': 'object',
                'additionalProperties': true,
              },
              DynamicSchemaProperty.dynamicInitState: {
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

class DynamicSchemaProperty {
  static const dynamic = 'dynamic';
  static const dynamicBuilderType = 'dynamicBuilderType';
  static const dynamicChildTemplate = 'dynamicChildTemplate';
  static const dynamicInitState = 'dynamicInitState';
}
