import 'package:json_theme/json_theme_schemas.dart';

class SafeAreaSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/safe_area.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/SafeArea-class.html',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'title': 'SafeAreaSchema',
        'additionalProperties': false,
        'properties': {
          'bottom': SchemaHelper.boolSchema,
          'left': SchemaHelper.boolSchema,
          'maintainBottomViewPadding': SchemaHelper.boolSchema,
          'minimum': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          'right': SchemaHelper.boolSchema,
          'top': SchemaHelper.boolSchema,
        },
      }
    ],
  };
}
