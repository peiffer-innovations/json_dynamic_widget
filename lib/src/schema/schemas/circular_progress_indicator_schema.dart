import 'package:json_theme/json_theme_schemas.dart';

class CircularProgressIndicatorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/circular_progress_indicator.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
    'type': 'object',
    'title': 'CircularProgressIndicator',
    'additionalProperties': false,
    'properties': {
      CircularProgressIndicatorSchemaProperty.backgroundColor:
          SchemaHelper.objectSchema(ColorSchema.id),
      CircularProgressIndicatorSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      CircularProgressIndicatorSchemaProperty.semanticsLabel: SchemaHelper.stringSchema,
      CircularProgressIndicatorSchemaProperty.semanticsValue: SchemaHelper.stringSchema,
      CircularProgressIndicatorSchemaProperty.strokeWidth: SchemaHelper.numberSchema,
      CircularProgressIndicatorSchemaProperty.value: SchemaHelper.numberSchema,
      CircularProgressIndicatorSchemaProperty.valueColor: SchemaHelper.anySchema
    },
  };
}

class CircularProgressIndicatorSchemaProperty {
  static const backgroundColor = 'backgroundColor';
  static const color = 'color';
  static const semanticsLabel = 'semanticsLabel';
  static const semanticsValue = 'semanticsValue';
  static const strokeWidth = 'strokeWidth';
  static const value = 'value';
  static const valueColor = 'valueColor';
}
