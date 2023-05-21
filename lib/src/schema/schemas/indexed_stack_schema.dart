import 'package:json_theme/json_theme_schemas.dart';

class IndexedStackSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/indexed_stack.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/IndexedStack-class.html',
    'title': 'IndexedStack',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          IndexedStackSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
          IndexedStackSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          IndexedStackSchemaProperty.index: SchemaHelper.numberSchema,
          IndexedStackSchemaProperty.sizing: SchemaHelper.objectSchema(StackFitSchema.id),
          IndexedStackSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
        },
      },
    ],
  };
}

class IndexedStackSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const index = 'index';
  static const sizing = 'sizing';
  static const textDirection = 'textDirection';
}
