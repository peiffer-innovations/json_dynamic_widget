import 'package:json_theme/json_theme_schemas.dart';

class CheckboxSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/checkbox';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'CheckboxBuilder',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
      'checkColor': SchemaHelper.objectSchema(ColorSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'label': SchemaHelper.stringSchema,
      'materialTapTargetSize':
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      'onChanged': SchemaHelper.stringSchema,
      'tristate': SchemaHelper.boolSchema,
      'validators': {
        'type': 'array',
        'items': {
          'type': 'object',
          'additionalProperties': true,
        },
      },
      'value': SchemaHelper.boolSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
