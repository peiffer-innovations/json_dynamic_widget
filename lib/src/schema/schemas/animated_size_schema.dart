import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html',
    'type': 'object',
    'title': 'AnimatedSize',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'reverseDuration': SchemaHelper.numberSchema,
      'vsync': SchemaHelper.stringSchema,
    },
  };
}
