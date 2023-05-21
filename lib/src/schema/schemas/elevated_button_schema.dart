import 'package:json_theme/json_theme_schemas.dart';

class ElevatedButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/elevated_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
    'type': 'object',
    'title': 'ElevatedButton',
    'additionalProperties': false,
    'properties': {
      ElevatedButtonSchemaProperty.autofocus: SchemaHelper.boolSchema,
      ElevatedButtonSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      ElevatedButtonSchemaProperty.focusNode: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.onFocusChange: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.onHover: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.onPressed: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.statesController: SchemaHelper.stringSchema,
      ElevatedButtonSchemaProperty.style: SchemaHelper.objectSchema(ButtonStyleSchema.id),
    }
  };
}

class ElevatedButtonSchemaProperty {
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
