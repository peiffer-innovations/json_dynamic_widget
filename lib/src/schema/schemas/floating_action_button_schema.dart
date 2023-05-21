import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/floating_action_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
    'type': 'object',
    'title': 'FloatingActionButton',
    'additionalProperties': false,
    'properties': {
      FloatingActionButtonSchemaProperty.autofocus: SchemaHelper.boolSchema,
      FloatingActionButtonSchemaProperty.backgroundColor: SchemaHelper.objectSchema(ColorSchema.id),
      FloatingActionButtonSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      FloatingActionButtonSchemaProperty.disabledElevation: SchemaHelper.numberSchema,
      FloatingActionButtonSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      FloatingActionButtonSchemaProperty.elevation: SchemaHelper.numberSchema,
      FloatingActionButtonSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      FloatingActionButtonSchemaProperty.focusElevation: SchemaHelper.numberSchema,
      FloatingActionButtonSchemaProperty.focusNode: SchemaHelper.stringSchema,
      FloatingActionButtonSchemaProperty.foregroundColor: SchemaHelper.objectSchema(ColorSchema.id),
      FloatingActionButtonSchemaProperty.heroTag: SchemaHelper.stringSchema,
      FloatingActionButtonSchemaProperty.highlightElevation: SchemaHelper.numberSchema,
      FloatingActionButtonSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      FloatingActionButtonSchemaProperty.hoverElevation: SchemaHelper.numberSchema,
      FloatingActionButtonSchemaProperty.isExtended: SchemaHelper.boolSchema,
      FloatingActionButtonSchemaProperty.materialTapTargetSize:
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      FloatingActionButtonSchemaProperty.mini: SchemaHelper.boolSchema,
      FloatingActionButtonSchemaProperty.mouseCursor:
          SchemaHelper.objectSchema(MouseCursorSchema.id),
      FloatingActionButtonSchemaProperty.onPressed: SchemaHelper.stringSchema,
      FloatingActionButtonSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
      FloatingActionButtonSchemaProperty.splashColor: SchemaHelper.objectSchema(ColorSchema.id),
      FloatingActionButtonSchemaProperty.tooltip: SchemaHelper.stringSchema,
    },
  };
}

class FloatingActionButtonSchemaProperty {
  static const autofocus = 'autofocus';
  static const backgroundColor = 'backgroundColor';
  static const clipBehavior = 'clipBehavior';
  static const disabledElevation = 'disabledElevation';
  static const enableFeedback = 'enableFeedback';
  static const elevation = 'elevation';
  static const focusColor = 'focusColor';
  static const focusElevation = 'focusElevation';
  static const focusNode = 'focusNode';
  static const foregroundColor = 'foregroundColor';
  static const heroTag = 'heroTag';
  static const highlightElevation = 'highlightElevation';
  static const hoverColor = 'hoverColor';
  static const hoverElevation = 'hoverElevation';
  static const isExtended = 'isExtended';
  static const materialTapTargetSize = 'materialTapTargetSize';
  static const mini = 'mini';
  static const mouseCursor = 'mouseCursor';
  static const onPressed = 'onPressed';
  static const shape = 'shape';
  static const splashColor = 'splashColor';
  static const tooltip = 'tooltip';
}
