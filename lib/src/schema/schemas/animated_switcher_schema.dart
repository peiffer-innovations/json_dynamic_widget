import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSwitcherSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_switcher';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedSwitcherBuilder',
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
