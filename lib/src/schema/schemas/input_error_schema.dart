import 'package:json_theme/json_theme_schemas.dart';

class InputErrorSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/input_error';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'InputErrorBuilder',
    'type': 'object',
    'additionalProperties': false,
    'required': [
      'text',
    ],
    'properties': {
      'text': {
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
