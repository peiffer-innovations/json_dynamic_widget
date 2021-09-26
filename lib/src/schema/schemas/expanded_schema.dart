import 'package:json_theme/json_theme_schemas.dart';

class ExpandedSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/expanded.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
    'title': 'Expanded',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'flex': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
