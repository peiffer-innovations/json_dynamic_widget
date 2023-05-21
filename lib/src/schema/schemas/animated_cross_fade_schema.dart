import 'package:json_theme/json_theme_schemas.dart';

class AnimatedCrossFadeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_cross_fade.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
      AnimatedCrossFadeSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      AnimatedCrossFadeSchemaProperty.crossFadeState: SchemaHelper.objectSchema(CrossFadeStateSchema.id),
      AnimatedCrossFadeSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedCrossFadeSchemaProperty.excludeBottomFocus: SchemaHelper.boolSchema,
      AnimatedCrossFadeSchemaProperty.firstCurve: SchemaHelper.stringSchema,
      AnimatedCrossFadeSchemaProperty.layoutBuilder: SchemaHelper.stringSchema,
      AnimatedCrossFadeSchemaProperty.reverseDuration: SchemaHelper.numberSchema,
      AnimatedCrossFadeSchemaProperty.secondCurve: SchemaHelper.stringSchema,
      AnimatedCrossFadeSchemaProperty.sizeCurve: SchemaHelper.stringSchema,
    },
  };
}

class AnimatedCrossFadeSchemaProperty {
  static const alignment = 'alignment';
  static const crossFadeState = 'crossFadeState';
  static const duration = 'duration';
  static const excludeBottomFocus = 'excludeBottomFocus';
  static const firstCurve = 'firstCurve';
  static const layoutBuilder = 'layoutBuilder';
  static const reverseDuration = 'reverseDuration';
  static const secondCurve = 'secondCurve';
  static const sizeCurve = 'sizeCurve';
}
