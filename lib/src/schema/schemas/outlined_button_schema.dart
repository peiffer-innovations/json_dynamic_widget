import 'package:json_theme/json_theme_schemas.dart';

class OutlinedButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/outlined_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
    'type': 'object',
    'title': 'OutlinedButton',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'onFocusChange': SchemaHelper.stringSchema,
      'onHover': SchemaHelper.stringSchema,
      'onLongPress': SchemaHelper.stringSchema,
      'onPressed': SchemaHelper.stringSchema,
      'style': SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}
