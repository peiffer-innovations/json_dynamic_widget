import 'package:json_theme/json_theme_schemas.dart';

class ClipRectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_rect.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipRect-class.html',
    'title': 'ClipRect',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
          'clipper': SchemaHelper.stringSchema,
        },
      },
    ],
  };
}
