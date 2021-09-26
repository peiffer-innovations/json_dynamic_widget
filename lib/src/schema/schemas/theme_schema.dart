import 'package:json_theme/json_theme_schemas.dart';

class ThemeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/theme.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Theme-class.html',
    'type': 'object',
    'title': 'Theme',
    'additionalProperties': false,
    'properties': {
      'data': SchemaHelper.objectSchema(ThemeDataSchema.id),
    }
  };
}
