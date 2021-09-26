import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPhysicalModelSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_physical_model.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html',
    'type': 'object',
    'title': 'AnimatedPhysicalModel',
    'additionalProperties': false,
    'required': [
      'color',
      'duration',
      'elevation',
      'shadowColor',
      'shape',
    ],
    'properties': {
      'animateColor': SchemaHelper.boolSchema,
      'animateShadowColor': SchemaHelper.boolSchema,
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'elevation': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(BoxShapeSchema.id),
    },
  };
}
