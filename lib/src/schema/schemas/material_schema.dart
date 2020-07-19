import 'package:json_theme/json_theme_schemas.dart';

class MaterialSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/material';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'MaterialBuilder',
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
          'textStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
        },
      },
    ],
  };
}
