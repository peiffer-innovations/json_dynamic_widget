import 'package:json_theme/json_theme_schemas.dart';

class OverflowBoxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/overflow_box';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'OverflowBoxBuilder',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'maxHeight': SchemaHelper.numberSchema,
      'maxWidth': SchemaHelper.numberSchema,
      'minHeight': SchemaHelper.numberSchema,
      'minWidth': SchemaHelper.numberSchema,
    }
  };
}
