import 'package:json_theme/json_theme_schemas.dart';

class AnimatedDefaultTextStyleSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/animated_default_text_style';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AnimatedDefaultTextStyleBuilder',
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
