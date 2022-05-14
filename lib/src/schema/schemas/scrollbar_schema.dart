import 'package:json_theme/json_theme_schemas.dart';

class ScrollbarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/scrollbar.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Scrollbar-class.html',
    'type': 'object',
    'title': 'Scrollbar',
    'additionalProperties': false,
    'properties': {
      'controller': SchemaHelper.stringSchema,
      'interactive': SchemaHelper.boolSchema,
      'notificationPredicate': SchemaHelper.stringSchema,
      'radius': SchemaHelper.objectSchema(RadiusSchema.id),
      'scrollbarOrientation': SchemaHelper.objectSchema(
        ScrollbarOrientationSchema.id,
      ),
      'thickness': SchemaHelper.numberSchema,
      'thumbVisibility': SchemaHelper.boolSchema,
    },
  };
}
