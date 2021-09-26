import 'package:json_theme/json_theme_schemas.dart';

class LinearProgressIndicatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/linear_progress_indicator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
    'type': 'object',
    'title': 'LinearProgressIndicator',
    'additionalProperties': false,
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'minHeight': SchemaHelper.numberSchema,
      'semanticsLabel': SchemaHelper.stringSchema,
      'semanticsValue': SchemaHelper.stringSchema,
      'value': SchemaHelper.numberSchema,
      'valueColor': SchemaHelper.anySchema
    },
  };
}
