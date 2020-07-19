import 'package:json_theme/json_theme_schemas.dart';

class SizedBoxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/sized_box';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'SizedBoxBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'height': SchemaHelper.numberSchema,
          'width': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
