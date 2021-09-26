import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPaddingSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_padding.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html',
    'type': 'object',
    'title': 'AnimatedPadding',
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
