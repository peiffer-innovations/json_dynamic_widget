import 'package:json_theme/json_theme_schemas.dart';

class OutlinedButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/outlined_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment':
        'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
    'type': 'object',
    'title': 'OutlinedButton',
    'additionalProperties': false,
    'properties': {
      OutlinedButtonSchemaProperty.autofocus: SchemaHelper.boolSchema,
      OutlinedButtonSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      OutlinedButtonSchemaProperty.focusNode: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.onFocusChange: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.onHover: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.onPressed: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.statesController: SchemaHelper.stringSchema,
      OutlinedButtonSchemaProperty.style: SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}
class OutlinedButtonSchemaProperty {
  static const autofocus = 'autofocus';
  static const clipBehavior = 'clipBehavior';
  static const focusNode = 'focusNode';
  static const onFocusChange = 'onFocusChange';
  static const onHover = 'onHover';
  static const onLongPress = 'onLongPress';
  static const onPressed = 'onPressed';
  static const statesController = 'statesController';
  static const style = 'style';
}
