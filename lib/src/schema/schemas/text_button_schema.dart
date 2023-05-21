import 'package:json_theme/json_theme_schemas.dart';

class TextButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/text_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/TextButton-class.html',
    'type': 'object',
    'title': 'TextButton',
    'additionalProperties': false,
    'properties': {
      TextButtonSchemaProperty.autofocus: SchemaHelper.boolSchema,
      TextButtonSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      TextButtonSchemaProperty.focusNode: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.onFocusChange: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.onHover: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.onPressed: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.statesController: SchemaHelper.stringSchema,
      TextButtonSchemaProperty.style: SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}

class TextButtonSchemaProperty {
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
