import 'package:json_theme/json_theme_schemas.dart';

class FlatButtonSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/flat_button';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'FlatButtonBuilder',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'colorBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'height': SchemaHelper.numberSchema,
      'highlightColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'materialTapTargetSize':
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      'minWidth': SchemaHelper.numberSchema,
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onHighlightChanged': SchemaHelper.stringSchema,
      'onPressed': SchemaHelper.stringSchema,
      'onLongPress': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
      'textTheme': SchemaHelper.objectSchema(ButtonTextThemeSchema.id),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
