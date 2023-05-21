import 'package:json_theme/json_theme_schemas.dart';

class ContainerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/container.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Container-class.html',
    'title': 'Container',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          ContainerSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
          ContainerSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          ContainerSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
          ContainerSchemaProperty.constraints: SchemaHelper.objectSchema(BoxConstraintsSchema.id),
          ContainerSchemaProperty.decoration: SchemaHelper.objectSchema(BoxDecorationSchema.id),
          ContainerSchemaProperty.foregroundDecoration:
              SchemaHelper.objectSchema(BoxDecorationSchema.id),
          ContainerSchemaProperty.height: SchemaHelper.numberSchema,
          ContainerSchemaProperty.margin: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          ContainerSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          ContainerSchemaProperty.transform: SchemaHelper.objectSchema(Matrix4Schema.id),
          ContainerSchemaProperty.transformAlignment: SchemaHelper.objectSchema(AlignmentSchema.id),
          ContainerSchemaProperty.width: SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

class ContainerSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const constraints = 'constraints';
  static const decoration = 'decoration';
  static const foregroundDecoration = 'foregroundDecoration';
  static const height = 'height';
  static const margin = 'margin';
  static const padding = 'padding';
  static const transform = 'transform';
  static const transformAlignment = 'transformAlignment';
  static const width = 'width';
}
