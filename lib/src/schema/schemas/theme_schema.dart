import 'package:json_theme/json_theme_schemas.dart';

class ThemeSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/theme';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'ThemeBuilder',
    'additionalProperties': false,
    'properties': {
      'data': SchemaHelper.objectSchema(ThemeDataSchema.id),
      'isMaterialAppTheme': SchemaHelper.boolSchema,
    }
  };
}
