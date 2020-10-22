import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ListTileSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/list_tile';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'ListTileBuilder',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'dense': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'hoverColor': SchemaHelper.objectSchema(ColorSchema.id),
      'isThreeLine': SchemaHelper.boolSchema,
      'leading': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'mouseCursor': SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onLongPress': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selected': SchemaHelper.boolSchema,
      'selectedTileColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'subtitle': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'tileColor': SchemaHelper.objectSchema(ColorSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'trailing': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}
