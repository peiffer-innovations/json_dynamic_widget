import 'package:json_theme/json_theme_schemas.dart';

class PaddingSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/padding.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
    'type': 'object',
    'title': 'Padding',
    'additionalProperties': false,
    'required': [
      'padding',
    ],
    'properties': {
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
    },
  };
}
