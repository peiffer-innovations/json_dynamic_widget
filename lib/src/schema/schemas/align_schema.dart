import 'package:json_theme/json_theme_schemas.dart';

class AlignSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/align';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AlignBuilder',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'heightFactor': SchemaHelper.numberSchema,
      'widthFactor': SchemaHelper.numberSchema,
    }
  };
}
