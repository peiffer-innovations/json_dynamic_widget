import 'package:json_theme/json_theme_schemas.dart';

class ClipPathSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_path.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipPath-class.html',
    'title': 'ClipPath',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          ClipPathSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          ClipPathSchemaProperty.clipper: SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

class ClipPathSchemaProperty {
  static const clipBehavior = 'clipBehavior';
  static const clipper = 'clipper';
}