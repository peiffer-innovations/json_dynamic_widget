import 'package:json_theme/json_theme_schemas.dart';

class SafeAreaSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/safe_area.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
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
          SafeAreaSchemaProperty.bottom: SchemaHelper.boolSchema,
          SafeAreaSchemaProperty.left: SchemaHelper.boolSchema,
          SafeAreaSchemaProperty.maintainBottomViewPadding: SchemaHelper.boolSchema,
          SafeAreaSchemaProperty.minimum: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
          SafeAreaSchemaProperty.right: SchemaHelper.boolSchema,
          SafeAreaSchemaProperty.top: SchemaHelper.boolSchema,
        },
      }
    ],
  };
}

class SafeAreaSchemaProperty {
  static const bottom = 'bottom';
  static const left = 'left';
  static const maintainBottomViewPadding = 'maintainBottomViewPadding';
  static const minimum = 'minimum';
  static const right = 'right';
  static const top = 'top';
}