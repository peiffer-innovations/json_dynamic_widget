import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class PopupMenuButtonSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/popup_menu_button';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'PopupMenuButtonBuilder',
    'additionalProperties': false,
    'properties': {
      'captureInheritedThemes': SchemaHelper.boolSchema,
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enabled': SchemaHelper.boolSchema,
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'initialValue': SchemaHelper.stringSchema,
      'itemBuilder': SchemaHelper.stringSchema,
      'offset': SchemaHelper.objectSchema(OffsetSchema.id),
      'onCanceled': SchemaHelper.stringSchema,
      'onSelected': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'tooltip': SchemaHelper.stringSchema,
    }
  };
}
