import 'package:json_theme/json_theme_schemas.dart';

class BaselineSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/baseline';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'BaselineBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'baseline',
          'baselineType',
        ],
        'properties': {
          'baseline': SchemaHelper.numberSchema,
          'baselineType': SchemaHelper.objectSchema(TextBaselineSchema.id),
        },
      },
    ],
  };
}
