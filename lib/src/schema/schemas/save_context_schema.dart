import 'package:json_theme/json_theme_schemas.dart';

class SaveContextSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/save_context';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'SaveContextBuilder',
    'additionalProperties': false,
    'properties': {
      'key': SchemaHelper.stringSchema,
    },
  };
}
