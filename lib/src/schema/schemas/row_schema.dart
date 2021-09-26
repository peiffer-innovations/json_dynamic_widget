import 'package:json_theme/json_theme_schemas.dart';

class RowSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/row.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
          'crossAxisAlignment':
              SchemaHelper.objectSchema(CrossAxisAlignmentSchema.id),
          'mainAxisAlignment':
              SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
          'mainAxisSize': SchemaHelper.objectSchema(MainAxisSizeSchema.id),
          'textBaseline': SchemaHelper.objectSchema(TextBaselineSchema.id),
          'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
          'verticalDirection':
              SchemaHelper.objectSchema(VerticalDirectionSchema.id),
        },
      },
    ],
  };
}
