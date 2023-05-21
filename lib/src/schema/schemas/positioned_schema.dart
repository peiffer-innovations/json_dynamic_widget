import 'package:json_theme/json_theme_schemas.dart';

class PositionedSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/positioned.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/Positioned-class.html',
    'type': 'object',
    'title': 'Positioned',
    'additionalProperties': false,
    'properties': {
      PositionedSchemaProperty.bottom: SchemaHelper.numberSchema,
      PositionedSchemaProperty.height: SchemaHelper.numberSchema,
      PositionedSchemaProperty.left: SchemaHelper.numberSchema,
      PositionedSchemaProperty.right: SchemaHelper.numberSchema,
      PositionedSchemaProperty.top: SchemaHelper.numberSchema,
      PositionedSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class PositionedSchemaProperty {
  static const bottom = 'bottom';
  static const height = 'height';
  static const left = 'left';
  static const right = 'right';
  static const top = 'top';
  static const width = 'width';
}
