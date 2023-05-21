import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSizeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_size.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html',
    'type': 'object',
    'title': 'AnimatedSize',
    'additionalProperties': false,
    'required': [
      'duration',
    ],
    'properties': {
      AnimatedSizeSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      AnimatedSizeSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      AnimatedSizeSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedSizeSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedSizeSchemaProperty.reverseDuration: SchemaHelper.numberSchema,
    },
  };
}

class AnimatedSizeSchemaProperty {
  static const alignment = 'alignment';
  static const clipBehavior = 'clipBehavior';
  static const curve = 'curve';
  static const duration = 'duration';
  static const reverseDuration = 'reverseDuration';
}
