import 'package:json_theme/json_theme_schemas.dart';

class CupertinoSwitchSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/cupertino_switch';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'CupertinoSwitchBuilder',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autovalidate': SchemaHelper.boolSchema,
      'dragStartBehavior':
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'label': SchemaHelper.stringSchema,
      'onChanged': SchemaHelper.stringSchema,
      'trackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'validators': {
        'type': 'array',
        'items': {
          'type': 'object',
          'additionalProperties': true,
        }
      },
      'value': SchemaHelper.boolSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
