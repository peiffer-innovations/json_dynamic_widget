import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPositionedDirectionalSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_positioned_directional';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedPositionedDirectionalBuilder',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      'bottom': SchemaHelper.numberSchema,
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'end': SchemaHelper.numberSchema,
      'height': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'start': SchemaHelper.numberSchema,
      'top': SchemaHelper.numberSchema,
      'width': SchemaHelper.numberSchema,
    },
  };
}
