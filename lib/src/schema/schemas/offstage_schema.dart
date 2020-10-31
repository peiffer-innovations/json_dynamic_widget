import 'package:json_theme/json_theme_schemas.dart';

class OffstageSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/offstage';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'OffstageBuilder',
    'additionalProperties': false,
    'properties': {
      'offstage': SchemaHelper.boolSchema,
    }
  };
}
