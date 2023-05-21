import 'package:json_theme/json_theme_schemas.dart';

class InputErrorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/input_error.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment':
        'https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/InputError-class.html',
    'title': 'InputError',
    'type': 'object',
    'additionalProperties': false,
    'required': [
      'text',
    ],
    'properties': {
      InputErrorSchemaProperty.text: {
        'oneOf': [
          {
            'type': 'null',
          },
          SchemaHelper.stringSchema,
        ],
      },
    },
  };
}

class InputErrorSchemaProperty {
  static const text = 'text';
}
