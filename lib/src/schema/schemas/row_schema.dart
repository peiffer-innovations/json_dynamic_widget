import 'package:json_theme/json_theme_schemas.dart';

class RowSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/row';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'RowBuilder',
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
