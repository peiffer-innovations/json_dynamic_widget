import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPositionedSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_positioned';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedPositionedBuilder',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      'bottom': SchemaHelper.numberSchema,
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'left': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'right': SchemaHelper.numberSchema,
      'top': SchemaHelper.numberSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
