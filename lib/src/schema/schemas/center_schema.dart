import 'package:json_theme/json_theme_schemas.dart';

class CenterSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/center';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CenterBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'heightFactor': SchemaHelper.numberSchema,
          'widthFactor': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
