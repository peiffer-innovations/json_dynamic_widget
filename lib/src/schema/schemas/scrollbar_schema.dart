import 'package:json_theme/json_theme_schemas.dart';

class ScrollbarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scrollbar.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Scrollbar-class.html',
    'type': 'object',
    'title': 'Scrollbar',
    'additionalProperties': false,
    'properties': {
      ScrollbarSchemaProperty.controller: SchemaHelper.stringSchema,
      ScrollbarSchemaProperty.interactive: SchemaHelper.boolSchema,
      ScrollbarSchemaProperty.notificationPredicate: SchemaHelper.stringSchema,
      ScrollbarSchemaProperty.radius: SchemaHelper.objectSchema(RadiusSchema.id),
      ScrollbarSchemaProperty.scrollbarOrientation: SchemaHelper.objectSchema(
        ScrollbarOrientationSchema.id,
      ),
      ScrollbarSchemaProperty.thickness: SchemaHelper.numberSchema,
      ScrollbarSchemaProperty.thumbVisibility: SchemaHelper.boolSchema,
    },
  };
}

class ScrollbarSchemaProperty {
  static const controller = 'controller';
  static const interactive = 'interactive';
  static const notificationPredicate = 'notificationPredicate';
  static const radius = 'radius';
  static const scrollbarOrientation = 'scrollbarOrientation';
  static const thickness = 'thickness';
  static const thumbVisibility = 'thumbVisibility';
}
