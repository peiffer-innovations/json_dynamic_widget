import 'package:json_theme/json_theme_schemas.dart';

class LimitedBoxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/limited_box.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/LimitedBox-class.html',
    'type': 'object',
    'title': 'LimitedBox',
    'additionalProperties': false,
    'properties': {
      'maxHeight': SchemaHelper.numberSchema,
      'maxWidth': SchemaHelper.numberSchema,
    }
  };
}
