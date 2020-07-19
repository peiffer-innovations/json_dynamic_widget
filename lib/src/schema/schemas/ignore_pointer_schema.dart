import 'package:json_theme/json_theme_schemas.dart';

class IgnorePointerSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/ignore_pointer';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'IgnorePointerBuilder',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'ignoring': SchemaHelper.boolSchema,
          'ignoringSemantics': SchemaHelper.boolSchema,
        },
      },
    ],
  };
}
