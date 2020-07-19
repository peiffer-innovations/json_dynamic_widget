import 'package:json_theme/json_theme_schemas.dart';

class SafeAreaSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/safe_area';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'title': 'SafeAreaSchemaBuilder',
        'additionalProperties': false,
        'properties': {
          'bottom': SchemaHelper.boolSchema,
          'left': SchemaHelper.boolSchema,
          'maintainBottomViewPadding': SchemaHelper.boolSchema,
          'minimum': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'right': SchemaHelper.boolSchema,
          'top': SchemaHelper.boolSchema,
        },
      }
    ],
  };
}
