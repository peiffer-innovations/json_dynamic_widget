import 'package:json_theme/json_theme_schemas.dart';

class IntrinsicWidthSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/intrinsic_width.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html',
    'type': 'object',
    'title': 'IntrinsicWidth',
    'additionalProperties': false,
    'properties': {
      IntrinsicWidthSchemaProperty.stepHeight: SchemaHelper.numberSchema,
      IntrinsicWidthSchemaProperty.stepWidth: SchemaHelper.numberSchema,
    }
  };
}

class IntrinsicWidthSchemaProperty {
  static const stepHeight = 'stepHeight';
  static const stepWidth = 'stepWidth';
}