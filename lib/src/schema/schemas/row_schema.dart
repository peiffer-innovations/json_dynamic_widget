import 'package:json_theme/json_theme_schemas.dart';

class RowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/row.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Row-class.html',
    'title': 'Row',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          RowSchemaProperty.crossAxisAlignment:
              SchemaHelper.objectSchema(CrossAxisAlignmentSchema.id),
          RowSchemaProperty.mainAxisAlignment:
              SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
          RowSchemaProperty.mainAxisSize: SchemaHelper.objectSchema(MainAxisSizeSchema.id),
          RowSchemaProperty.textBaseline: SchemaHelper.objectSchema(TextBaselineSchema.id),
          RowSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
          RowSchemaProperty.verticalDirection:
              SchemaHelper.objectSchema(VerticalDirectionSchema.id),
        },
      },
    ],
  };
}

class RowSchemaProperty {
  static const crossAxisAlignment = 'crossAxisAlignment';
  static const mainAxisAlignment = 'mainAxisAlignment';
  static const mainAxisSize = 'mainAxisSize';
  static const textBaseline = 'textBaseline';
  static const textDirection = 'textDirection';
  static const verticalDirection = 'verticalDirection';
}
