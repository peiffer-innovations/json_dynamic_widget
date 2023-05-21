import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPositionedDirectionalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_positioned_directional.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedPositionedDirectional-class.html',
    'type': 'object',
    'title': 'AnimatedPositionedDirectional',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      AnimatedPositionedDirectionalSchemaProperty.bottom: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedPositionedDirectionalSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.end: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.height: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedPositionedDirectionalSchemaProperty.start: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.top: SchemaHelper.numberSchema,
      AnimatedPositionedDirectionalSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class AnimatedPositionedDirectionalSchemaProperty {
  static const bottom = 'bottom';
  static const curve = 'curve';
  static const duration = 'duration';
  static const end = 'end';
  static const height = 'height';
  static const onEnd = 'onEnd';
  static const start = 'start';
  static const top = 'top';
  static const width = 'width';
}
