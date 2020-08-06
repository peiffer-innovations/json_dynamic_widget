import 'package:json_theme/json_theme_schemas.dart';

class InkWellSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/ink_well';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'InkWellBuilder',
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
      'radius': SchemaHelper.numberSchema,
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'splashFactory':
          SchemaHelper.objectSchema(InteractiveInkFeatureFactorySchema.id)
    },
  };
}
