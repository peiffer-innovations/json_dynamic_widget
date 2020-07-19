import 'package:json_theme/json_theme_schemas.dart';

class ExpandedSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/expanded';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ExpandedBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'flex': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
