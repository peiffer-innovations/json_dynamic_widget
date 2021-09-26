import 'package:json_theme/json_theme_schemas.dart';

class IgnorePointerSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/ignore_pointer.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/IgnorePointer-class.html',
    'title': 'IgnorePointer',
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
