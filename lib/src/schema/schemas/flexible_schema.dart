import 'package:json_theme/json_theme_schemas.dart';

class FlexibleSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/flexible';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FlexibleBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'fit': SchemaHelper.objectSchema(FlexFitSchema.id),
          'flex': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
