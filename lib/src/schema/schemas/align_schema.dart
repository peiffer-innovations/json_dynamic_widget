import 'package:json_theme/json_theme_schemas.dart';

class AlignSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/align.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Align-class.html',
    'type': 'object',
    'title': 'Align',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'heightFactor': SchemaHelper.numberSchema,
      'widthFactor': SchemaHelper.numberSchema,
    }
  };
}
