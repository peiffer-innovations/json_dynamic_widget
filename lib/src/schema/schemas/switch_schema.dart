import 'package:json_theme/json_theme_schemas.dart';

class SwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/switch.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/Switch-class.html',
    'type': 'object',
    'title': 'Switch',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'activeThumbImage': SchemaHelper.objectSchema(ImageProviderSchema.id),
      'activeTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'dragStartBehavior':
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveThumbColor': SchemaHelper.objectSchema(ColorSchema.id),
      'inactiveThumbImage': SchemaHelper.objectSchema(ImageProviderSchema.id),
      'inactiveTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'label': SchemaHelper.stringSchema,
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onActiveThumbImageError': SchemaHelper.stringSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onInactiveThumbImageError': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'splashRadius': SchemaHelper.numberSchema,
      'thumbColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'trackColor': SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      'validators': SchemaHelper.anySchema,
      'value': SchemaHelper.boolSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    }
  };
}
