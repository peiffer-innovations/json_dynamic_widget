import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPaddingSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_padding';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedPaddingBuilder',
    'additionalProperties': false,
    'required': [
      'duration',
      'padding',
    ],
    'properties': {
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
