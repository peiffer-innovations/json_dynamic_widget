import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPositionedDirectionalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_positioned_directional.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedPositionedDirectional-class.html',
    'type': 'object',
    'title': 'AnimatedPositionedDirectional',
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
