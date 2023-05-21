import 'package:json_theme/json_theme_schemas.dart';

class OverflowBoxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/overflow_box.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/OverflowBox-class.html',
    'type': 'object',
    'title': 'OverflowBox',
    'additionalProperties': false,
    'properties': {
      OverflowBoxSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      OverflowBoxSchemaProperty.maxHeight: SchemaHelper.numberSchema,
      OverflowBoxSchemaProperty.maxWidth: SchemaHelper.numberSchema,
      OverflowBoxSchemaProperty.minHeight: SchemaHelper.numberSchema,
      OverflowBoxSchemaProperty.minWidth: SchemaHelper.numberSchema,
    }
  };
}

class OverflowBoxSchemaProperty {
  static const alignment = 'alignment';
  static const maxHeight = 'maxHeight';
  static const maxWidth = 'maxWidth';
  static const minHeight = 'minHeight';
  static const minWidth = 'minWidth';
}
