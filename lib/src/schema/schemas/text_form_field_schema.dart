import 'package:json_theme/json_theme_schemas.dart';

class TextFormFieldSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/text_form_field';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'TextFormFieldBuilder',
    'additionalProperties': false,
    'properties': {
      'autocorrect': SchemaHelper.boolSchema,
      'autofillHints': {
        'type': 'array',
        'items': {
          'type': 'string',
        },
      },
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'buildCounter': SchemaHelper.stringSchema,
      'controller': SchemaHelper.stringSchema,
      'cursorColor': SchemaHelper.objectSchema(ColorSchema.id),
      'cursorHeight': SchemaHelper.numberSchema,
      'cursorRadius': SchemaHelper.objectSchema(RadiusSchema.id),
      'cursorWidth': SchemaHelper.numberSchema,
      'decoration': SchemaHelper.anySchema,
      'enableInteractiveSelection': SchemaHelper.boolSchema,
      'enableSuggestions': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'expands': SchemaHelper.boolSchema,
      'focusNode': SchemaHelper.stringSchema,
      'initialValue': SchemaHelper.stringSchema,
      'inputFormatters': SchemaHelper.anySchema,
      'keyboardAppearance': SchemaHelper.objectSchema(BrightnessSchema.id),
      'keyboardType': SchemaHelper.objectSchema(TextInputTypeSchema.id),
      'maxLength': SchemaHelper.numberSchema,
      'maxLengthEnforced': SchemaHelper.boolSchema,
      'maxLines': SchemaHelper.numberSchema,
      'minLines': SchemaHelper.numberSchema,
      'obscureText': SchemaHelper.boolSchema,
      'obscuringCharacter': SchemaHelper.stringSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onEditingComplete': SchemaHelper.stringSchema,
      'onFieldSubmitted': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'readOnly': SchemaHelper.boolSchema,
      'scrollPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'scrollPhysics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      'showCursor': SchemaHelper.boolSchema,
      'smartDashesType': SchemaHelper.objectSchema(SmartDashesTypeSchema.id),
      'smartQuotesType': SchemaHelper.objectSchema(SmartQuotesTypeSchema.id),
      'strutStyle': SchemaHelper.objectSchema(StrutStyleSchema.id),
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'textAlign': SchemaHelper.objectSchema(TextAlignSchema.id),
      'textAlignVertical':
          SchemaHelper.objectSchema(TextAlignVerticalSchema.id),
      'textCapitalization':
          SchemaHelper.objectSchema(TextCapitalizationSchema.id),
      'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
      'textInputAction': SchemaHelper.objectSchema(TextInputActionSchema.id),
      'toolbarOptions': SchemaHelper.objectSchema(ToolbarOptionsSchema.id),
      'validators': SchemaHelper.anySchema,
    }
  };
}
