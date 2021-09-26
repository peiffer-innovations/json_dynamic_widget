import 'package:json_theme/json_theme_schemas.dart';

class TextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/text.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Text-class.html',
    'type': 'object',
    'title': 'Text',
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
