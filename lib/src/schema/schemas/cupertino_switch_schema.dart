import 'package:json_theme/json_theme_schemas.dart';

class CupertinoSwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/cupertino_switch.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/cupertino/CupertinoSwitch-class.html',
    'type': 'object',
    'title': 'CupertinoSwitch',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'dragStartBehavior':
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'label': SchemaHelper.stringSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'thumbColor': SchemaHelper.objectSchema(ColorSchema.id),
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
