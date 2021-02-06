import 'package:json_theme/json_theme_schemas.dart';

class RaisedButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/raised_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/RaisedButton-class.html',
    'type': 'object',
    'title': 'RaisedButtonBuilder',
    'additionalProperties': false,
    'properties': {
      'animationDuration': SchemaHelper.numberSchema,
      'autofocus': SchemaHelper.boolSchema,
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'colorBrightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'disabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'disabledElevation': SchemaHelper.numberSchema,
      'disabledTextColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusElevation': SchemaHelper.numberSchema,
      'focusNode': SchemaHelper.stringSchema,
      'highlightColor': SchemaHelper.objectSchema(ColorSchema.id),
      'highlightElevation': SchemaHelper.numberSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverElevation': SchemaHelper.numberSchema,
      'materialTapTargetSize': SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
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
