import 'package:json_theme/json_theme_schemas.dart';

class BaselineSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/baseline.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Baseline-class.html',
    'title': 'Baseline',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'required': [
          'baseline',
          'baselineType',
        ],
        'properties': {
          'baseline': SchemaHelper.numberSchema,
          'baselineType': SchemaHelper.objectSchema(TextBaselineSchema.id),
        },
      },
    ],
  };
}
