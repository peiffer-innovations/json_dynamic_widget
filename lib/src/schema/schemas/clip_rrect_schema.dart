import 'package:json_theme/json_theme_schemas.dart';

class ClipRRectSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/clip_rrect.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/ClipRRect-class.html',
    'type': 'object',
    'title': 'ClipRRect',
    'additionalProperties': false,
    'required': [
      'borderRadius',
    ],
    'properties': {
      ClipRRectSchemaProperty.borderRadius: SchemaHelper.objectSchema(BorderRadiusSchema.id),
      ClipRRectSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      ClipRRectSchemaProperty.clipper: SchemaHelper.stringSchema,
    },
  };
}

class ClipRRectSchemaProperty {
  static const borderRadius = 'borderRadius';
  static const clipBehavior = 'clipBehavior';
  static const clipper = 'clipper';
}