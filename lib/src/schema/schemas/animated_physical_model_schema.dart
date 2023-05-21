import 'package:json_theme/json_theme_schemas.dart';

class AnimatedPhysicalModelSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_physical_model.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html',
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
      AnimatedPhysicalModelSchemaProperty.animateColor: SchemaHelper.boolSchema,
      AnimatedPhysicalModelSchemaProperty.animateShadowColor: SchemaHelper.boolSchema,
      AnimatedPhysicalModelSchemaProperty.borderRadius:
          SchemaHelper.objectSchema(BorderRadiusSchema.id),
      AnimatedPhysicalModelSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      AnimatedPhysicalModelSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      AnimatedPhysicalModelSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedPhysicalModelSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedPhysicalModelSchemaProperty.elevation: SchemaHelper.numberSchema,
      AnimatedPhysicalModelSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedPhysicalModelSchemaProperty.shadowColor: SchemaHelper.objectSchema(ColorSchema.id),
      AnimatedPhysicalModelSchemaProperty.shape: SchemaHelper.objectSchema(BoxShapeSchema.id),
    },
  };
}

class AnimatedPhysicalModelSchemaProperty {
  static const animateColor = 'animateColor';
  static const animateShadowColor = 'animateShadowColor';
  static const borderRadius = 'borderRadius';
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const curve = 'curve';
  static const duration = 'duration';
  static const elevation = 'elevation';
  static const onEnd = 'onEnd';
  static const shadowColor = 'shadowColor';
  static const shape = 'shape';
}
