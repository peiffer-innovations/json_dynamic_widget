import 'package:json_theme/json_theme_schemas.dart';

class TextSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/text';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'TextBuilder',
    'additionalProperties': false,
    'required': [
      'text',
    ],
    'properties': {
      'locale': SchemaHelper.objectSchema(LocaleSchema.id),
      'maxLines': SchemaHelper.numberSchema,
      'overflow': SchemaHelper.objectSchema(TextOverflowSchema.id),
      'semanticsLabel': SchemaHelper.stringSchema,
      'softWrap': SchemaHelper.boolSchema,
      'strutStyle': SchemaHelper.objectSchema(StrutStyleSchema.id),
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'text': SchemaHelper.stringSchema,
      'textAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
      'textHeightBehavior':
          SchemaHelper.objectSchema(TextHeightBehaviorSchema.id),
      'textScaleFactor': SchemaHelper.numberSchema,
      'textWidthBasis': SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    }
  };
}
