import 'package:json_theme/json_theme_schemas.dart';

class CardSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/card.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
          CardSchemaProperty.borderOnForeground: SchemaHelper.boolSchema,
          CardSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          CardSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
          CardSchemaProperty.elevation: SchemaHelper.numberSchema,
          CardSchemaProperty.margin: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          CardSchemaProperty.semanticContainer: SchemaHelper.boolSchema,
          CardSchemaProperty.shadowColor: SchemaHelper.objectSchema(ColorSchema.id),
          CardSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
          CardSchemaProperty.surfaceTintColor: SchemaHelper.objectSchema(ColorSchema.id),
        },
      },
    ],
  };
}

class CardSchemaProperty {
  static const borderOnForeground = 'borderOnForeground';
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const elevation = 'elevation';
  static const margin = 'margin';
  static const semanticContainer = 'semanticContainer';
  static const shadowColor = 'shadowColor';
  static const shape = 'shape';
  static const surfaceTintColor = 'surfaceTintColor';
}