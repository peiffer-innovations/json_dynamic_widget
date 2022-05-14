import 'package:json_theme/json_theme_schemas.dart';

class InkWellSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/ink_well.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/InkWell-class.html',
    'type': 'object',
    'title': 'InkWell',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'canRequestFocus': SchemaHelper.boolSchema,
      'customBorder': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'enableFeedback': SchemaHelper.boolSchema,
      'excludeFromSemantics': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'highlightColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onDoubleTap': SchemaHelper.stringSchema,
      'onFocusChange': SchemaHelper.stringSchema,
      'onHighlightChanged': SchemaHelper.stringSchema,
      'onHover': SchemaHelper.stringSchema,
      'onLongPress': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'onTapCancel': SchemaHelper.stringSchema,
      'onTapDown': SchemaHelper.stringSchema,
      'onTapUp': SchemaHelper.stringSchema,
      'overlayColor': SchemaHelper.objectSchema(
        MaterialStatePropertyMouseCursorSchema.id,
      ),
      'radius': SchemaHelper.numberSchema,
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'splashFactory':
          SchemaHelper.objectSchema(InteractiveInkFeatureFactorySchema.id)
    },
  };
}
