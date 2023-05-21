import 'package:json_theme/json_theme_schemas.dart';

class StackSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/stack.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Stack-class.html',
    'title': 'Stack',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          StackSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
          StackSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
          StackSchemaProperty.fit: SchemaHelper.objectSchema(StackFitSchema.id),
          StackSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
        },
      },
    ],
  };
}

class StackSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const fit = 'fit';
  static const textDirection = 'textDirection';
}
