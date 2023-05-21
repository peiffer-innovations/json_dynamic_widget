import 'package:json_theme/json_theme_schemas.dart';

class AnimatedDefaultTextStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_default_text_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html',
    'type': 'object',
    'title': 'AnimatedDefaultTextStyle',
    'additionalProperties': false,
    'required': [
      'duration',
      'style',
    ],
    'properties': {
      AnimatedDefaultTextStyleSchemaProperty.curve: SchemaHelper.stringSchema,
      AnimatedDefaultTextStyleSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedDefaultTextStyleSchemaProperty.maxLines: SchemaHelper.numberSchema,
      AnimatedDefaultTextStyleSchemaProperty.onEnd: SchemaHelper.stringSchema,
      AnimatedDefaultTextStyleSchemaProperty.overflow:
          SchemaHelper.objectSchema(TextOverflowSchema.id),
      AnimatedDefaultTextStyleSchemaProperty.softWrap: SchemaHelper.boolSchema,
      AnimatedDefaultTextStyleSchemaProperty.style: SchemaHelper.objectSchema(TextStyleSchema.id),
      AnimatedDefaultTextStyleSchemaProperty.textAlign:
          SchemaHelper.objectSchema(TextAlignSchema.id),
      AnimatedDefaultTextStyleSchemaProperty.textHeightBehavior:
          SchemaHelper.objectSchema(TextHeightBehaviorSchema.id),
      AnimatedDefaultTextStyleSchemaProperty.textWidthBasis:
          SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    },
  };
}

class AnimatedDefaultTextStyleSchemaProperty {
  static const curve = 'curve';
  static const duration = 'duration';
  static const maxLines = 'maxLines';
  static const onEnd = 'onEnd';
  static const overflow = 'overflow';
  static const softWrap = 'softWrap';
  static const style = 'style';
  static const textAlign = 'textAlign';
  static const textHeightBehavior = 'textHeightBehavior';
  static const textWidthBasis = 'textWidthBasis';
}
