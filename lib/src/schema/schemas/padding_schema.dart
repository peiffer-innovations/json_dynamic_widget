import 'package:json_theme/json_theme_schemas.dart';

class PaddingSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/padding';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'PaddingBuilder',
    'additionalProperties': false,
    'required': [
      'padding',
    ],
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
