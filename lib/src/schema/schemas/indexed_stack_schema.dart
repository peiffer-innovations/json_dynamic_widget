import 'package:json_theme/json_theme_schemas.dart';

class IndexedStackSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/indexed_stack';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IndexedStackBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'index': SchemaHelper.numberSchema,
          'sizing': SchemaHelper.objectSchema(StackFitSchema.id),
          'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
        },
      },
    ],
  };
}
