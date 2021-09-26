import 'package:json_theme/json_theme_schemas.dart';

class DirectionalitySchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/directionality.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/Directionality-class.html',
    'type': 'object',
    'title': 'Directionality',
    'additionalProperties': false,
    'required': [
      'textDirection',
    ],
    'properties': {
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
    }
  };
}
