import 'package:json_theme/json_theme_schemas.dart';

class AnimatedCrossFadeSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_cross_fade';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedCrossFadeBuilder',
    'additionalProperties': false,
    'required': [
      'crossFadeState',
      'duration',
    ],
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'crossFadeState': SchemaHelper.objectSchema(CrossFadeStateSchema.id),
      'duration': SchemaHelper.numberSchema,
      'firstCurve': SchemaHelper.stringSchema,
      'layoutBuilder': SchemaHelper.stringSchema,
      'reverseDuration': SchemaHelper.numberSchema,
      'secondCurve': SchemaHelper.stringSchema,
      'sizeCurve': SchemaHelper.stringSchema,
    },
  };
}
