import 'package:json_theme/json_theme_schemas.dart';

class RichTextSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/rich_text.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/RichText-class.html',
    'type': 'object',
    'title': 'RichText',
    'additionalProperties': false,
    'required': [
      'text',
    ],
    'properties': {
      RichTextSchemaProperty.locale: SchemaHelper.objectSchema(LocaleSchema.id),
      RichTextSchemaProperty.maxLines: SchemaHelper.numberSchema,
      RichTextSchemaProperty.overflow: SchemaHelper.objectSchema(TextOverflowSchema.id),
      RichTextSchemaProperty.selectionColor: SchemaHelper.objectSchema(ColorSchema.id),
      RichTextSchemaProperty.selectionRegistrar: SchemaHelper.stringSchema,
      RichTextSchemaProperty.softWrap: SchemaHelper.boolSchema,
      RichTextSchemaProperty.strutStyle: SchemaHelper.objectSchema(StrutStyleSchema.id),
      RichTextSchemaProperty.text: SchemaHelper.objectSchema(TextSpanSchema.id),
      RichTextSchemaProperty.textAlign: SchemaHelper.objectSchema(TextAlignSchema.id),
      RichTextSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
      RichTextSchemaProperty.textHeightBehavior:
          SchemaHelper.objectSchema(TextHeightBehaviorSchema.id),
      RichTextSchemaProperty.textScaleFactor: SchemaHelper.numberSchema,
      RichTextSchemaProperty.textWidthBasis: SchemaHelper.objectSchema(TextWidthBasisSchema.id),
    }
  };
}

class RichTextSchemaProperty {
  static const locale = 'locale';
  static const maxLines = 'maxLines';
  static const overflow = 'overflow';
  static const selectionColor = 'selectionColor';
  static const selectionRegistrar = 'selectionRegistrar';
  static const softWrap = 'softWrap';
  static const strutStyle = 'strutStyle';
  static const text = 'text';
  static const textAlign = 'textAlign';
  static const textDirection = 'textDirection';
  static const textHeightBehavior = 'textHeightBehavior';
  static const textScaleFactor = 'textScaleFactor';
  static const textWidthBasis = 'textWidthBasis';
}
