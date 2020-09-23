import 'package:json_theme/json_theme_schemas.dart';

class StackSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/stack';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'StackBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'fit': SchemaHelper.objectSchema(StackFitSchema.id),
          'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
        },
      },
    ],
  };
}
