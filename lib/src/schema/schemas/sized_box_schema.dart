import 'package:json_theme/json_theme_schemas.dart';

class SizedBoxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/sized_box.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
    'title': 'SizedBox',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          SizedBoxSchemaPropertyKey.height: SchemaHelper.numberSchema,
          SizedBoxSchemaPropertyKey.width: SchemaHelper.numberSchema,
        },
      },
    ],
  };
}

class SizedBoxSchemaPropertyKey {
  static const height = 'height';
  static const width = 'width';
}
