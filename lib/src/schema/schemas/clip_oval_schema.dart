import 'package:json_theme/json_theme_schemas.dart';

class ClipOvalSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_oval.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
          ClipOvalSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          ClipOvalSchemaProperty.clipper: SchemaHelper.stringSchema,
        },
      },
    ],
  };
}

class ClipOvalSchemaProperty {
  static const clipBehavior = 'clipBehavior';
  static const clipper = 'clipper';
}
