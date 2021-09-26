import 'package:json_theme/json_theme_schemas.dart';

class AnimatedOpacitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_opacity.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
    'type': 'object',
    'title': 'AnimatedOpacity',
    'additionalProperties': false,
    'required': [
      'duration',
      'opacity',
    ],
    'properties': {
      'alwaysIncludeSemantics': SchemaHelper.boolSchema,
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'opacity': SchemaHelper.stringSchema,
    },
  };
}
