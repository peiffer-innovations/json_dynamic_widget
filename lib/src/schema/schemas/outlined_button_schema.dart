import 'package:json_theme/json_theme_schemas.dart';

class OutlinedButtonSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/outlined_button';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'OutlinedButton',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'onLongPress': SchemaHelper.stringSchema,
      'onPressed': SchemaHelper.stringSchema,
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}
