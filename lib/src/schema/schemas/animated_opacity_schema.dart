import 'package:json_theme/json_theme_schemas.dart';

class AnimatedOpacitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_opacity.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
    'type': 'object',
    'title': 'AnimatedOpacity',
    'additionalProperties': false,
    'required': [
      'duration',
      'opacity',
    ],
    'properties': {
      AnimatedOpacitySchemaProperty.alwaysIncludeSemantics: SchemaHelper.boolSchema,
      AnimatedOpacitySchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedOpacitySchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedOpacitySchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedOpacitySchemaProperty.opacity: SchemaHelper.stringSchema,
    },
  };
}

class AnimatedOpacitySchemaProperty {
  static const alwaysIncludeSemantics = 'alwaysIncludeSemantics';
  static const curve = 'curve';
  static const duration = 'duration';
  static const onEnd = 'onEnd';
  static const opacity = 'opacity';
}
