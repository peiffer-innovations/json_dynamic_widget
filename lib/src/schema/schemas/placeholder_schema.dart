import 'package:json_theme/json_theme_schemas.dart';

class PlaceholderSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/placeholder';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'PlaceholderBuilder',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'fallbackHeight': SchemaHelper.numberSchema,
      'fallbackWidth': SchemaHelper.numberSchema,
      'strokeWidth': SchemaHelper.numberSchema,
    }
  };
}
