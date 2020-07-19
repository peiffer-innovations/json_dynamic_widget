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
      'contentPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'dense': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'isThreeLine': SchemaHelper.boolSchema,
      'leading': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'onLongPress': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selected': SchemaHelper.boolSchema,
      'subtitle': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'trailing': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
    },
  };
}
