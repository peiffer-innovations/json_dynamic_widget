import 'package:json_theme/json_theme_schemas.dart';

class SaveContextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/save_context.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/JsonSaveContextBuilder-class.html',
    'type': 'object',
    'title': 'SaveContext',
    'additionalProperties': false,
    'properties': {
      'key': SchemaHelper.stringSchema,
    },
  };
}
