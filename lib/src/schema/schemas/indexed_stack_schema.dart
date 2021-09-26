import 'package:json_theme/json_theme_schemas.dart';

class IndexedStackSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/indexed_stack.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
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
          'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
          'index': SchemaHelper.numberSchema,
          'sizing': SchemaHelper.objectSchema(StackFitSchema.id),
          'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
        },
      },
    ],
  };
}
