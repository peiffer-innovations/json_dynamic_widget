import 'package:json_theme/json_theme_schemas.dart';

class AnimatedThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/AnimatedTheme-class.html',
    'type': 'object',
    'title': 'AnimatedTheme',
    'additionalProperties': false,
    'required': [
      'data',
    ],
    'properties': {
      AnimatedThemeSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedThemeSchemaProperty.data: SchemaHelper.objectSchema(ThemeDataSchema.id),
      AnimatedThemeSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedThemeSchemaProperty.onEnd: SchemaHelper.stringSchema,
    },
  };
}

class AnimatedThemeSchemaProperty {
  static const curve = 'curve';
  static const data = 'data';
  static const duration = 'duration';
  static const onEnd = 'onEnd';
}
