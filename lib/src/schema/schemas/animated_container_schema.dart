import 'package:json_theme/json_theme_schemas.dart';

class AnimatedContainerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_container.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
    'title': 'AnimatedContainer',
    'required': [
      'duration',
    ],
    'properties': {
      AnimatedContainerSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      AnimatedContainerSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ColorSchema.id),
      AnimatedContainerSchemaProperty.color: SchemaHelper.objectSchema(ClipSchema.id),
      AnimatedContainerSchemaProperty.constraints:
          SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      AnimatedContainerSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedContainerSchemaProperty.decoration: SchemaHelper.objectSchema(BoxDecorationSchema.id),
      AnimatedContainerSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedContainerSchemaProperty.foregroundDecoration:
          SchemaHelper.objectSchema(BoxDecorationSchema.id),
      AnimatedContainerSchemaProperty.height: SchemaHelper.numberSchema,
      AnimatedContainerSchemaProperty.margin:
          SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      AnimatedContainerSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedContainerSchemaProperty.padding:
          SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      AnimatedContainerSchemaProperty.transform: SchemaHelper.objectSchema(Matrix4Schema.id),
      AnimatedContainerSchemaProperty.transformAlignment:
          SchemaHelper.objectSchema(AlignmentSchema.id),
      AnimatedContainerSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class AnimatedContainerSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const constraints = 'constraints';
  static const curve = 'curve';
  static const decoration = 'decoration';
  static const duration = 'duration';
  static const foregroundDecoration = 'foregroundDecoration';
  static const height = 'height';
  static const margin = 'margin';
  static const onEnd = 'onEnd';
  static const padding = 'padding';
  static const transform = 'transform';
  static const transformAlignment = 'transformAlignment';
  static const width = 'width';
}
