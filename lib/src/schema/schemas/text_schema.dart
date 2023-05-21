import 'package:json_theme/json_theme_schemas.dart';

class TextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/text.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Text-class.html',
    'type': 'object',
    'title': 'Text',
    'additionalProperties': false,
    'required': [
      'text',
    ],
    'properties': {
      TextSchemaProperty.locale: SchemaHelper.objectSchema(LocaleSchema.id),
      TextSchemaProperty.maxLines: SchemaHelper.numberSchema,
      TextSchemaProperty.overflow: SchemaHelper.objectSchema(TextOverflowSchema.id),
      TextSchemaProperty.selectionColor: SchemaHelper.objectSchema(ColorSchema.id),
      TextSchemaProperty.semanticsLabel: SchemaHelper.stringSchema,
      TextSchemaProperty.softWrap: SchemaHelper.boolSchema,
      TextSchemaProperty.strutStyle: SchemaHelper.objectSchema(StrutStyleSchema.id),
      TextSchemaProperty.style: SchemaHelper.objectSchema(TextStyleSchema.id),
      TextSchemaProperty.text: SchemaHelper.stringSchema,
      TextSchemaProperty.textAlign: SchemaHelper.objectSchema(TextAlignSchema.id),
      TextSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
      TextSchemaProperty.textHeightBehavior: SchemaHelper.objectSchema(
        TextHeightBehaviorSchema.id,
      ),
      TextSchemaProperty.textScaleFactor: SchemaHelper.numberSchema,
      TextSchemaProperty.textWidthBasis: SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    }
  };
}

class TextSchemaProperty {
  static const locale = 'locale';
  static const maxLines = 'maxLines';
  static const overflow = 'overflow';
  static const selectionColor = 'selectionColor';
  static const semanticsLabel = 'semanticsLabel';
  static const softWrap = 'softWrap';
  static const strutStyle = 'strutStyle';
  static const style = 'style';
  static const text = 'text';
  static const textAlign = 'textAlign';
  static const textDirection = 'textDirection';
  static const textHeightBehavior = 'textHeightBehavior';
  static const textScaleFactor = 'textScaleFactor';
  static const textWidthBasis = 'textWidthBasis';
}
