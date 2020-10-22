import 'package:json_theme/json_theme_schemas.dart';

class SwitchSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/switch';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'SwitchBuilder',
    'additionalProperties': false,
    'properties': {
      'activeColor': SchemaHelper.objectSchema(ColorSchema.id),
      'activeThumbImage': SchemaHelper.objectSchema(ImageProviderSchema.id),
      'activeTrackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
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
      'trackColor': SchemaHelper.objectSchema(ColorSchema.id),
      'validators': SchemaHelper.anySchema,
      'value': SchemaHelper.boolSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    }
  };
}
