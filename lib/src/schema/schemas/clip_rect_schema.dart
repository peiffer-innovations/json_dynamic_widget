import 'package:json_theme/json_theme_schemas.dart';

class ClipRectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_rect.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
          ClipRectSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          ClipRectSchemaProperty.clipper: SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

class ClipRectSchemaProperty {
  static const clipBehavior = 'clipBehavior';
  static const clipper = 'clipper';
}