import 'package:json_theme/json_theme_schemas.dart';

class AlignSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/align.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Align-class.html',
    'type': 'object',
    'title': 'Align',
    'additionalProperties': false,
    'properties': {
      AlignSchemaPropertyKey.alignment:
          SchemaHelper.objectSchema(AlignmentSchema.id),
      AlignSchemaPropertyKey.heightFactor: SchemaHelper.numberSchema,
      AlignSchemaPropertyKey.widthFactor: SchemaHelper.numberSchema,
    }
  };
}

class AlignSchemaPropertyKey {
  static const alignment = 'alignment';
  static const heightFactor = 'heightFactor';
  static const widthFactor = 'widthFactor';
}
