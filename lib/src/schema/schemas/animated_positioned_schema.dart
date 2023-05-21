import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPositionedSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_positioned.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html',
    'type': 'object',
    'title': 'AnimatedPositioned',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      AnimatedPositionedSchemaProperty.bottom: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedPositionedSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.height: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.left: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedPositionedSchemaProperty.right: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.top: SchemaHelper.numberSchema,
      AnimatedPositionedSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class AnimatedPositionedSchemaProperty {
  static const bottom = 'bottom';
  static const curve = 'curve';
  static const duration = 'duration';
  static const height = 'height';
  static const left = 'left';
  static const onEnd = 'onEnd';
  static const right = 'right';
  static const top = 'top';
  static const width = 'width';
}
