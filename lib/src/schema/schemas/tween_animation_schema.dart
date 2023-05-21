import 'package:json_theme/json_theme_schemas.dart';

class TweenAnimationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/tween_animation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/animation/Tween-class.html',
    'type': 'object',
    'title': 'TweenAnimation',
    'additionalProperties': false,
    'required': [
      'builder',
      'duration',
      'tween',
    ],
    'properties': {
      TweenAnimationSchemaProperty.builder: SchemaHelper.stringSchema,
      TweenAnimationSchemaProperty.curve: SchemaHelper.stringSchema,
      TweenAnimationSchemaProperty.duration: SchemaHelper.numberSchema,
      TweenAnimationSchemaProperty.onEnd: SchemaHelper.stringSchema,
      TweenAnimationSchemaProperty.tween: SchemaHelper.stringSchema,
    },
  };
}

class TweenAnimationSchemaProperty {
  static const builder = 'builder';
  static const curve = 'curve';
  static const duration = 'duration';
  static const onEnd = 'onEnd';
  static const tween = 'tween';
}
