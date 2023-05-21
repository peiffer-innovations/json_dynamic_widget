import 'package:json_theme/json_theme_schemas.dart';

class PlaceholderSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/placeholder.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/Placeholder-class.html',
    'type': 'object',
    'title': 'Placeholder',
    'additionalProperties': false,
    'properties': {
      PlaceholderSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      PlaceholderSchemaProperty.fallbackHeight: SchemaHelper.numberSchema,
      PlaceholderSchemaProperty.fallbackWidth: SchemaHelper.numberSchema,
      PlaceholderSchemaProperty.strokeWidth: SchemaHelper.numberSchema,
    }
  };
}

class PlaceholderSchemaProperty {
  static const color = 'color';
  static const fallbackHeight = 'fallbackHeight';
  static const fallbackWidth = 'fallbackWidth';
  static const strokeWidth = 'strokeWidth';
}
