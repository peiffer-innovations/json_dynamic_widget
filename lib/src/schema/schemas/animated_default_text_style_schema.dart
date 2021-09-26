import 'package:json_theme/json_theme_schemas.dart';

class AnimatedDefaultTextStyleSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_default_text_style.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html',
    'type': 'object',
    'title': 'AnimatedDefaultTextStyle',
    'additionalProperties': false,
    'required': [
      'duration',
      'style',
    ],
    'properties': {
      'curve': SchemaHelper.stringSchema,
      'duration': SchemaHelper.numberSchema,
      'maxLines': SchemaHelper.numberSchema,
      'onEnd': SchemaHelper.stringSchema,
      'overflow': SchemaHelper.objectSchema(TextOverflowSchema.id),
      'softWrap': SchemaHelper.boolSchema,
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'textAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textHeightBehavior':
          SchemaHelper.objectSchema(TextHeightBehaviorSchema.id),
      'textWidthBasis': SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    },
  };
}
