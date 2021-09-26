import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSwitcherSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_switcher.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
    'type': 'object',
    'title': 'AnimatedSwitcher',
    'additionalProperties': false,
    'required': [
      'child',
      'duration',
    ],
    'properties': {
      'child': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'layoutBuilder': SchemaHelper.stringSchema,
      'reverseDuration': SchemaHelper.numberSchema,
      'switchInCurve': SchemaHelper.stringSchema,
      'switchOutCurve': SchemaHelper.stringSchema,
      'transitionBuilder': SchemaHelper.stringSchema,
    },
  };
}
