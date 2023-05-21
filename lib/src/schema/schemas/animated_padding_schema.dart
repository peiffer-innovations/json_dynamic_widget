import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPaddingSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_padding.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
      AnimatedPaddingSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedPaddingSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedPaddingSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedPaddingSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}

class AnimatedPaddingSchemaProperty {
  static const curve = 'curve';
  static const duration = 'duration';
  static const onEnd = 'onEnd';
  static const padding = 'padding';
}
