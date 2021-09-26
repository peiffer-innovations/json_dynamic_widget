import 'package:json_theme/json_theme_schemas.dart';

class DottedBorderSchema {
  static const id = 'https://your-url-here.com/schemas/dotted_border';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'DottedBorder',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'dashPattern': SchemaHelper.anySchema,
    },
  };
}
