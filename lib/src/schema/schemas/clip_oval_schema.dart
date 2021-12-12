import 'package:json_theme/json_theme_schemas.dart';

class ClipOvalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_oval.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipOval-class.html',
    'title': 'ClipOval',
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
