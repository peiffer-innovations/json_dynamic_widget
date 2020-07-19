import 'package:json_theme/json_theme_schemas.dart';

class CardSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/card';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'CardBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'borderOnForeground': SchemaHelper.boolSchema,
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'color': SchemaHelper.objectSchema(ColorSchema.id),
          'elevation': SchemaHelper.numberSchema,
          'margin': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'semanticContainer': SchemaHelper.boolSchema,
          'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
          'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
        },
      },
    ],
  };
}
