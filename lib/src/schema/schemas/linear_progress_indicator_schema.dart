import 'package:json_theme/json_theme_schemas.dart';

class LinearProgressIndicatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/linear_progress_indicator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
    'type': 'object',
    'title': 'LinearProgressIndicator',
    'additionalProperties': false,
    'properties': {
      LinearProgressIndicatorSchemaProperty.backgroundColor:
          SchemaHelper.objectSchema(ColorSchema.id),
      LinearProgressIndicatorSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      LinearProgressIndicatorSchemaProperty.minHeight: SchemaHelper.numberSchema,
      LinearProgressIndicatorSchemaProperty.semanticsLabel: SchemaHelper.stringSchema,
      LinearProgressIndicatorSchemaProperty.semanticsValue: SchemaHelper.stringSchema,
      LinearProgressIndicatorSchemaProperty.value: SchemaHelper.numberSchema,
      LinearProgressIndicatorSchemaProperty.valueColor: SchemaHelper.anySchema
    },
  };
}

class LinearProgressIndicatorSchemaProperty {
  static const backgroundColor = 'backgroundColor';
  static const color = 'color';
  static const minHeight = 'minHeight';
  static const semanticsLabel = 'semanticsLabel';
  static const semanticsValue = 'semanticsValue';
  static const value = 'value';
  static const valueColor = 'valueColor';
}
