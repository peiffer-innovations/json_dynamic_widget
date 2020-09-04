import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPhysicalModelSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_physical_model';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedPhysicalModelBuilder',
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
