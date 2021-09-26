import 'package:json_theme/json_theme_schemas.dart';

class FlexibleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/flexible.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Flexible-class.html',
    'title': 'Flexible',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'additionalProperties': false,
        'type': 'object',
        'properties': {
          'fit': SchemaHelper.objectSchema(FlexFitSchema.id),
          'flex': SchemaHelper.numberSchema,
        },
      },
    ],
  };
}
