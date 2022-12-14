import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class PopupMenuButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/popup_menu_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$comment':
        'https://api.flutter.dev/flutter/material/PopupMenuButton-class.html',
    'type': 'object',
    'title': 'PopupMenuButton',
    'additionalProperties': false,
    'properties': {
      'clipBehavior': SchemaHelper.objectSchema(ClipSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'constraints': SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enabled': SchemaHelper.boolSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'iconSize': SchemaHelper.numberSchema,
      'initialValue': SchemaHelper.stringSchema,
      'itemBuilder': SchemaHelper.stringSchema,
      'offset': SchemaHelper.objectSchema(OffsetSchema.id),
      'onCanceled': SchemaHelper.stringSchema,
      'onOpened': SchemaHelper.stringSchema,
      'onSelected': SchemaHelper.stringSchema,
      'padding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'position': SchemaHelper.objectSchema(PopupMenuPositionSchema.id),
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'splashRadius': SchemaHelper.numberSchema,
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'tooltip': SchemaHelper.stringSchema,
    }
  };
}
