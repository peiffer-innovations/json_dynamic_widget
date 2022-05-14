import 'package:json_theme/json_theme_schemas.dart';

class CardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/card.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Card-class.html',
    'title': 'Card',
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
          'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
        },
      },
    ],
  };
}
