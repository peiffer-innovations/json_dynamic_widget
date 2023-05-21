import 'package:json_theme/json_theme_schemas.dart';

class MaterialSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/material.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/Material-class.html',
    'title': 'Material',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          MaterialSchemaProperty.animationDuration: SchemaHelper.numberSchema,
          MaterialSchemaProperty.borderOnForeground: SchemaHelper.boolSchema,
          MaterialSchemaProperty.borderRadius: SchemaHelper.objectSchema(BorderRadiusSchema.id),
          MaterialSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          MaterialSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
          MaterialSchemaProperty.elevation: SchemaHelper.numberSchema,
          MaterialSchemaProperty.margin: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          MaterialSchemaProperty.materialType: SchemaHelper.objectSchema(MaterialTypeSchema.id),
          MaterialSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          MaterialSchemaProperty.shadowColor: SchemaHelper.objectSchema(ColorSchema.id),
          MaterialSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
          MaterialSchemaProperty.surfaceTintColor: SchemaHelper.objectSchema(ColorSchema.id),
          MaterialSchemaProperty.textStyle: SchemaHelper.objectSchema(TextStyleSchema.id),
        },
      },
    ],
  };
}

class MaterialSchemaProperty {
  static const animationDuration = 'animationDuration';
  static const borderOnForeground = 'borderOnForeground';
  static const borderRadius = 'borderRadius';
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const elevation = 'elevation';
  static const margin = 'margin';
  static const materialType = 'materialType';
  static const padding = 'padding';
  static const shadowColor = 'shadowColor';
  static const shape = 'shape';
  static const surfaceTintColor = 'surfaceTintColor';
  static const textStyle = 'textStyle';
}
