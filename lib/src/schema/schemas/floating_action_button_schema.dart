import 'package:json_theme/json_theme_schemas.dart';

class FloatingActionButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/floating_action_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
    'type': 'object',
    'title': 'FloatingActionButton',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'disabledElevation': SchemaHelper.numberSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'elevation': SchemaHelper.numberSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusElevation': SchemaHelper.numberSchema,
      'focusNode': SchemaHelper.stringSchema,
      'foregroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'heroTag': SchemaHelper.stringSchema,
      'highlightElevation': SchemaHelper.numberSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'hoverElevation': SchemaHelper.numberSchema,
      'isExtended': SchemaHelper.boolSchema,
      'materialTapTargetSize':
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      'mini': SchemaHelper.boolSchema,
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onPressed': SchemaHelper.stringSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'splashColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tooltip': SchemaHelper.stringSchema,
    },
  };
}
