import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSizeSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_size';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedSizeBuilder',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'reverseDuration': SchemaHelper.numberSchema,
      'vsync': SchemaHelper.stringSchema,
    },
  };
}
