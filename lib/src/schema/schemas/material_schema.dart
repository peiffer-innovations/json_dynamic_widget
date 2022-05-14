import 'package:json_theme/json_theme_schemas.dart';

class MaterialSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/material.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
          'animationDuration': SchemaHelper.numberSchema,
          'borderOnForeground': SchemaHelper.boolSchema,
          'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'color': SchemaHelper.objectSchema(ColorSchema.id),
          'elevation': SchemaHelper.numberSchema,
          'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'materialType': SchemaHelper.objectSchema(MaterialTypeSchema.id),
          'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
          'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
          'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
          'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
        },
      },
    ],
  };
}
