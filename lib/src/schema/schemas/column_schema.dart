import 'package:json_theme/json_theme_schemas.dart';

class ColumnSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/column.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Column-class.html',
    'title': 'Column',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          ColumnSchemaPropertyKey.crossAxisAlignment:
              SchemaHelper.objectSchema(CrossAxisAlignmentSchema.id),
          ColumnSchemaPropertyKey.mainAxisAlignment:
              SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
          ColumnSchemaPropertyKey.mainAxisSize: SchemaHelper.objectSchema(MainAxisSizeSchema.id),
          ColumnSchemaPropertyKey.textBaseline: SchemaHelper.objectSchema(TextBaselineSchema.id),
          ColumnSchemaPropertyKey.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
          ColumnSchemaPropertyKey.verticalDirection:
              SchemaHelper.objectSchema(VerticalDirectionSchema.id),
        },
      },
    ],
  };
}

class ColumnSchemaPropertyKey {
  static const crossAxisAlignment = 'crossAxisAlignment';
  static const mainAxisAlignment = 'mainAxisAlignment';
  static const mainAxisSize = 'mainAxisSize';
  static const textBaseline = 'textBaseline';
  static const textDirection = 'textDirection';
  static const verticalDirection = 'verticalDirection';
}
