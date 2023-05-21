import 'package:json_theme/json_theme_schemas.dart';

class WrapSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/wrap.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Wrap-class.html',
    'type': 'object',
    'title': 'Wrap',
    'additionalProperties': false,
    'properties': {
      WrapSchemaProperty.alignment: SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      WrapSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      WrapSchemaProperty.crossAxisAlignment: SchemaHelper.objectSchema(WrapCrossAlignmentSchema.id),
      WrapSchemaProperty.direction: SchemaHelper.objectSchema(AxisSchema.id),
      WrapSchemaProperty.runAlignment: SchemaHelper.objectSchema(WrapAlignmentSchema.id),
      WrapSchemaProperty.runSpacing: SchemaHelper.numberSchema,
      WrapSchemaProperty.spacing: SchemaHelper.numberSchema,
      WrapSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id)
    },
  };
}

class WrapSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const crossAxisAlignment = 'crossAxisAlignment';
  static const direction = 'direction';
  static const runAlignment = 'runAlignment';
  static const runSpacing = 'runSpacing';
  static const spacing = 'spacing';
  static const textDirection = 'textDirection';
}
