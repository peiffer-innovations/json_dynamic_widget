import 'package:json_theme/json_theme_schemas.dart';

class InkWellSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/ink_well.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/InkWell-class.html',
    'type': 'object',
    'title': 'InkWell',
    'additionalProperties': false,
    'properties': {
      InkWellSchemaProperty.autofocus: SchemaHelper.boolSchema,
      InkWellSchemaProperty.borderRadius: SchemaHelper.objectSchema(BorderRadiusSchema.id),
      InkWellSchemaProperty.canRequestFocus: SchemaHelper.boolSchema,
      InkWellSchemaProperty.customBorder: SchemaHelper.objectSchema(ShapeBorderSchema.id),
      InkWellSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      InkWellSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      InkWellSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      InkWellSchemaProperty.focusNode: SchemaHelper.stringSchema,
      InkWellSchemaProperty.highlightColor: SchemaHelper.objectSchema(ColorSchema.id),
      InkWellSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      InkWellSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      InkWellSchemaProperty.onDoubleTap: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onFocusChange: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onHighlightChanged: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onHover: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onTap: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onTapCancel: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onTapDown: SchemaHelper.stringSchema,
      InkWellSchemaProperty.onTapUp: SchemaHelper.stringSchema,
      InkWellSchemaProperty.overlayColor: SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      InkWellSchemaProperty.radius: SchemaHelper.numberSchema,
      InkWellSchemaProperty.splashColor: SchemaHelper.objectSchema(ColorSchema.id),
      InkWellSchemaProperty.splashFactory: SchemaHelper.objectSchema(
        InteractiveInkFeatureFactorySchema.id,
      ),
      InkWellSchemaProperty.statesController: SchemaHelper.stringSchema,
    },
  };
}

class InkWellSchemaProperty {
  static const autofocus = 'autofocus';
  static const borderRadius = 'borderRadius';
  static const canRequestFocus = 'canRequestFocus';
  static const customBorder = 'customBorder';
  static const enableFeedback = 'enableFeedback';
  static const excludeFromSemantics = 'excludeFromSemantics';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const highlightColor = 'highlightColor';
  static const hoverColor = 'hoverColor';
  static const mouseCursor = 'mouseCursor';
  static const onDoubleTap = 'onDoubleTap';
  static const onFocusChange = 'onFocusChange';
  static const onHighlightChanged = 'onHighlightChanged';
  static const onHover = 'onHover';
  static const onLongPress = 'onLongPress';
  static const onTap = 'onTap';
  static const onTapCancel = 'onTapCancel';
  static const onTapDown = 'onTapDown';
  static const onTapUp = 'onTapUp';
  static const overlayColor = 'overlayColor';
  static const radius = 'radius';
  static const splashColor = 'splashColor';
  static const splashFactory = 'splashFactory';
  static const statesController = 'statesController';
}
