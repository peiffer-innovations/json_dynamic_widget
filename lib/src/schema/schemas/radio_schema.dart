import 'package:json_theme/json_theme_schemas.dart';

class RadioSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/radio';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'RadioBuilder',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'checkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'groupValue': SchemaHelper.anySchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'label': SchemaHelper.stringSchema,
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onChanged': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'toggleable': SchemaHelper.boolSchema,
      'validators': SchemaHelper.anySchema,
      'value': SchemaHelper.anySchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
