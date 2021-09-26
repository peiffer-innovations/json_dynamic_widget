import 'package:json_theme/json_theme_schemas.dart';

class AnimatedAlignSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_align.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html',
    'type': 'object',
    'title': 'AnimatedAlign',
    'additionalProperties': false,
    'required': [
      'alignment',
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'heightFactor': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'widthFactor': SchemaHelper.numberSchema,
    },
  };
}
