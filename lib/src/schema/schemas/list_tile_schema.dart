import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ListTileSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/list_tile.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/ListTile-class.html',
    'type': 'object',
    'title': 'ListTile',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'dense': SchemaHelper.boolSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'horizontalTitleGap': SchemaHelper.numberSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconColor': SchemaHelper.objectSchema(ColorSchema.id),
      'isThreeLine': SchemaHelper.boolSchema,
      'leading': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'minLeadingWidth': SchemaHelper.numberSchema,
      'minVerticalPadding': SchemaHelper.numberSchema,
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onLongPress': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selected': SchemaHelper.boolSchema,
      'selectedColor': SchemaHelper.objectSchema(ColorSchema.id),
      'selectedTileColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'style': SchemaHelper.objectSchema(ListTileStyleSchema.id),
      'subtitle': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'textColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tileColor': SchemaHelper.objectSchema(ColorSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'trailing': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
