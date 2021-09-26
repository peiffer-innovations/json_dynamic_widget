import 'package:json_theme/json_theme_schemas.dart';

class TweenAnimationSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/tween_animation.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
      'builder': SchemaHelper.stringSchema,
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'tween': SchemaHelper.stringSchema,
    },
  };
}
