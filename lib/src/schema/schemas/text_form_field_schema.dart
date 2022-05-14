import 'package:json_theme/json_theme_schemas.dart';

class TextFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/text_form_field.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/TextFormField-class.html',
    'type': 'object',
    'title': 'TextFormField',
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
      'enableIMEPersonalizedLearning': SchemaHelper.boolSchema,
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
      'maxLengthEnforcement': SchemaHelper.objectSchema(
        MaxLengthEnforcementSchema.id,
      ),
      'maxLines': SchemaHelper.numberSchema,
      'minLines': SchemaHelper.numberSchema,
      'mouseCursor': SchemaHelper.objectSchema(TextFormFieldSchema.id),
      'obscureText': SchemaHelper.boolSchema,
      'obscuringCharacter': SchemaHelper.stringSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onEditingComplete': SchemaHelper.stringSchema,
      'onFieldSubmitted': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'readOnly': SchemaHelper.boolSchema,
      'restorationId': SchemaHelper.stringSchema,
      'scrollController': SchemaHelper.stringSchema,
      'scrollPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'scrollPhysics': SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      'selectionControls': SchemaHelper.stringSchema,
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
