import 'package:json_theme/json_theme_schemas.dart';

class AnimatedAlignSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_align';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedAlignBuilder',
    'additionalProperties': false,
    'required': [
      'alignment',
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
    },
  };
}
