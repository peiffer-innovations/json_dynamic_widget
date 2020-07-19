import 'package:json_theme/json_theme_schemas.dart';

class FittedBoxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/fitted_box';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'FittedBoxBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'fit': SchemaHelper.objectSchema(BoxFitSchema.id),
        },
      },
    ],
  };
}
