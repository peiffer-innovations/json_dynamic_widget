import 'package:json_theme/json_theme_schemas.dart';

class AnimatedCrossFadeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_cross_fade.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html',
    'type': 'object',
    'title': 'AnimatedCrossFade',
    'additionalProperties': false,
    'required': [
      'crossFadeState',
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'crossFadeState': SchemaHelper.objectSchema(CrossFadeStateSchema.id),
      'duration': SchemaHelper.numberSchema,
      'excludeBottomFocus': SchemaHelper.boolSchema,
      'firstCurve': SchemaHelper.stringSchema,
      'layoutBuilder': SchemaHelper.stringSchema,
      'reverseDuration': SchemaHelper.numberSchema,
      'secondCurve': SchemaHelper.stringSchema,
      'sizeCurve': SchemaHelper.stringSchema,
    },
  };
}
