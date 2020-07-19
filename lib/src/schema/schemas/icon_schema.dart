import 'package:json_theme/json_theme_schemas.dart';

class IconSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/icon';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'IconBuilder',
    'additionalProperties': false,
    'required': [
      'icon',
    ],
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'icon': SchemaHelper.objectSchema(IconDataSchema.id),
      'semanticLabel': SchemaHelper.stringSchema,
      'size': SchemaHelper.numberSchema,
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
    },
  };
}
