import 'package:json_theme/json_theme_schemas.dart';

class TextFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/text_form_field.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/TextFormField-class.html',
    'type': 'object',
    'title': 'TextFormField',
    'additionalProperties': false,
    'properties': {
      TextFormFieldSchemaProperty.autocorrect: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.autofillHints: {
        'type': 'array',
        'items': {
          'type': 'string',
        },
      },
      TextFormFieldSchemaProperty.autofocus: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.autovalidate: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.autovalidateMode:
          SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      TextFormFieldSchemaProperty.buildCounter: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.contextMenuBuilder: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.controller: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.cursorColor: SchemaHelper.objectSchema(ColorSchema.id),
      TextFormFieldSchemaProperty.cursorHeight: SchemaHelper.numberSchema,
      TextFormFieldSchemaProperty.cursorRadius: SchemaHelper.objectSchema(RadiusSchema.id),
      TextFormFieldSchemaProperty.cursorWidth: SchemaHelper.numberSchema,
      TextFormFieldSchemaProperty.decoration: SchemaHelper.anySchema,
      TextFormFieldSchemaProperty.enableIMEPersonalizedLearning: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.enableInteractiveSelection: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.enableSuggestions: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.enabled: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.expands: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.focusNode: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.initialValue: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.inputFormatters: SchemaHelper.anySchema,
      TextFormFieldSchemaProperty.keyboardAppearance:
          SchemaHelper.objectSchema(BrightnessSchema.id),
      TextFormFieldSchemaProperty.keyboardType: SchemaHelper.objectSchema(TextInputTypeSchema.id),
      TextFormFieldSchemaProperty.maxLength: SchemaHelper.numberSchema,
      TextFormFieldSchemaProperty.maxLengthEnforcement: SchemaHelper.objectSchema(
        MaxLengthEnforcementSchema.id,
      ),
      TextFormFieldSchemaProperty.maxLines: SchemaHelper.numberSchema,
      TextFormFieldSchemaProperty.minLines: SchemaHelper.numberSchema,
      TextFormFieldSchemaProperty.mouseCursor: SchemaHelper.objectSchema(TextFormFieldSchema.id),
      TextFormFieldSchemaProperty.obscureText: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.obscuringCharacter: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onChanged: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onEditingComplete: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onFieldSubmitted: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onSaved: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onTap: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.onTapOutside: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.readOnly: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.restorationId: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.scrollController: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.scrollPadding:
          SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      TextFormFieldSchemaProperty.scrollPhysics: SchemaHelper.objectSchema(ScrollPhysicsSchema.id),
      TextFormFieldSchemaProperty.selectionControls: SchemaHelper.stringSchema,
      TextFormFieldSchemaProperty.showCursor: SchemaHelper.boolSchema,
      TextFormFieldSchemaProperty.smartDashesType:
          SchemaHelper.objectSchema(SmartDashesTypeSchema.id),
      TextFormFieldSchemaProperty.smartQuotesType:
          SchemaHelper.objectSchema(SmartQuotesTypeSchema.id),
      TextFormFieldSchemaProperty.strutStyle: SchemaHelper.objectSchema(StrutStyleSchema.id),
      TextFormFieldSchemaProperty.style: SchemaHelper.objectSchema(TextStyleSchema.id),
      TextFormFieldSchemaProperty.textAlign: SchemaHelper.objectSchema(TextAlignSchema.id),
      TextFormFieldSchemaProperty.textAlignVertical:
          SchemaHelper.objectSchema(TextAlignVerticalSchema.id),
      TextFormFieldSchemaProperty.textCapitalization:
          SchemaHelper.objectSchema(TextCapitalizationSchema.id),
      TextFormFieldSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
      TextFormFieldSchemaProperty.textInputAction:
          SchemaHelper.objectSchema(TextInputActionSchema.id),
      TextFormFieldSchemaProperty.validators: SchemaHelper.anySchema,
    }
  };
}

class TextFormFieldSchemaProperty {
  static const autocorrect = 'autocorrect';
  static const autofillHints = 'autofillHints';
  static const autofocus = 'autofocus';
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const buildCounter = 'buildCounter';
  static const contextMenuBuilder = 'contextMenuBuilder';
  static const controller = 'controller';
  static const cursorColor = 'cursorColor';
  static const cursorHeight = 'cursorHeight';
  static const cursorRadius = 'cursorRadius';
  static const cursorWidth = 'cursorWidth';
  static const decoration = 'decoration';
  static const enableIMEPersonalizedLearning = 'enableIMEPersonalizedLearning';
  static const enableInteractiveSelection = 'enableInteractiveSelection';
  static const enableSuggestions = 'enableSuggestions';
  static const enabled = 'enabled';
  static const expands = 'expands';
  static const focusNode = 'focusNode';
  static const initialValue = 'initialValue';
  static const inputFormatters = 'inputFormatters';
  static const keyboardAppearance = 'keyboardAppearance';
  static const keyboardType = 'keyboardType';
  static const maxLength = 'maxLength';
  static const maxLengthEnforcement = 'maxLengthEnforcement';
  static const maxLines = 'maxLines';
  static const minLines = 'minLines';
  static const mouseCursor = 'mouseCursor';
  static const obscureText = 'obscureText';
  static const obscuringCharacter = 'obscuringCharacter';
  static const onChanged = 'onChanged';
  static const onEditingComplete = 'onEditingComplete';
  static const onFieldSubmitted = 'onFieldSubmitted';
  static const onSaved = 'onSaved';
  static const onTap = 'onTap';
  static const onTapOutside = 'onTapOutside';
  static const readOnly = 'readOnly';
  static const restorationId = 'restorationId';
  static const scrollController = 'scrollController';
  static const scrollPadding = 'scrollPadding';
  static const scrollPhysics = 'scrollPhysics';
  static const selectionControls = 'selectionControls';
  static const showCursor = 'showCursor';
  static const smartDashesType = 'smartDashesType';
  static const smartQuotesType = 'smartQuotesType';
  static const strutStyle = 'strutStyle';
  static const style = 'style';
  static const textAlign = 'textAlign';
  static const textAlignVertical = 'textAlignVertical';
  static const textCapitalization = 'textCapitalization';
  static const textDirection = 'textDirection';
  static const textInputAction = 'textInputAction';
  static const validators = 'validators';
}
