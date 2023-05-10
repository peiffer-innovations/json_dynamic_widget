import 'package:json_theme/json_theme_schemas.dart';

class AnimatedAlignSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_align.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html',
    'type': 'object',
    'title': 'AnimatedAlign',
    'additionalProperties': false,
    'required': [
      'alignment',
      'duration',
    ],
    'properties': {
      AnimatedAlignSchemaPropertyKey.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      AnimatedAlignSchemaPropertyKey.curve: SchemaHelper.stringSchema,
      AnimatedAlignSchemaPropertyKey.duration: SchemaHelper.numberSchema,
      AnimatedAlignSchemaPropertyKey.heightFactor: SchemaHelper.numberSchema,
      AnimatedAlignSchemaPropertyKey.onEnd: SchemaHelper.stringSchema,
      AnimatedAlignSchemaPropertyKey.widthFactor: SchemaHelper.numberSchema,
    },
  };
}

class AnimatedAlignSchemaPropertyKey {
  static const alignment = 'alignment';
  static const curve = 'curve';
  static const duration = 'duration';
  static const heightFactor = 'heightFactor';
  static const onEnd = 'onEnd';
  static const widthFactor = 'widthFactor';
}
