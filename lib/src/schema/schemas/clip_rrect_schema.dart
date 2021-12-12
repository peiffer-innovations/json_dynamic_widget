import 'package:json_theme/json_theme_schemas.dart';

class ClipRRectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_rrect.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipRRect-class.html',
    'type': 'object',
    'title': 'ClipRRect',
    'additionalProperties': false,
    'required': [
      'borderRadius',
    ],
    'properties': {
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'clipper': SchemaHelper.stringSchema,
    },
  };
}
