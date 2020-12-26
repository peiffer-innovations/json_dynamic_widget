import 'package:json_theme/json_theme_schemas.dart';

class RadioSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/radio.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Radio-class.html',
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
      'id': SchemaHelper.stringSchema,
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
