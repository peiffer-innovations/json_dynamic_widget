import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class PopupMenuButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/popup_menu_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/PopupMenuButton-class.html',
    'type': 'object',
    'title': 'PopupMenuButton',
    'additionalProperties': false,
    'properties': {
      PopupMenuButtonSchemaProperty.clipBehavior: SchemaHelper.objectSchema(ClipSchema.id),
      PopupMenuButtonSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      PopupMenuButtonSchemaProperty.constraints: SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      PopupMenuButtonSchemaProperty.elevation: SchemaHelper.numberSchema,
      PopupMenuButtonSchemaProperty.enabled: SchemaHelper.boolSchema,
      PopupMenuButtonSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      PopupMenuButtonSchemaProperty.icon: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      PopupMenuButtonSchemaProperty.iconSize: SchemaHelper.numberSchema,
      PopupMenuButtonSchemaProperty.initialValue: SchemaHelper.stringSchema,
      PopupMenuButtonSchemaProperty.itemBuilder: SchemaHelper.stringSchema,
      PopupMenuButtonSchemaProperty.offset: SchemaHelper.objectSchema(OffsetSchema.id),
      PopupMenuButtonSchemaProperty.onCanceled: SchemaHelper.stringSchema,
      PopupMenuButtonSchemaProperty.onOpened: SchemaHelper.stringSchema,
      PopupMenuButtonSchemaProperty.onSelected: SchemaHelper.stringSchema,
      PopupMenuButtonSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      PopupMenuButtonSchemaProperty.position: SchemaHelper.objectSchema(PopupMenuPositionSchema.id),
      PopupMenuButtonSchemaProperty.shadowColor: SchemaHelper.objectSchema(ColorSchema.id),
      PopupMenuButtonSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
      PopupMenuButtonSchemaProperty.splashRadius: SchemaHelper.numberSchema,
      PopupMenuButtonSchemaProperty.surfaceTintColor: SchemaHelper.objectSchema(ColorSchema.id),
      PopupMenuButtonSchemaProperty.tooltip: SchemaHelper.stringSchema,
    }
  };
}

class PopupMenuButtonSchemaProperty {
  static const clipBehavior = 'clipBehavior';
  static const color = 'color';
  static const constraints = 'constraints';
  static const elevation = 'elevation';
  static const enabled = 'enabled';
  static const enableFeedback = 'enableFeedback';
  static const icon = 'icon';
  static const iconSize = 'iconSize';
  static const initialValue = 'initialValue';
  static const itemBuilder = 'itemBuilder';
  static const offset = 'offset';
  static const onCanceled = 'onCanceled';
  static const onOpened = 'onOpened';
  static const onSelected = 'onSelected';
  static const padding = 'padding';
  static const position = 'position';
  static const shadowColor = 'shadowColor';
  static const shape = 'shape';
  static const splashRadius = 'splashRadius';
  static const surfaceTintColor = 'surfaceTintColor';
  static const tooltip = 'tooltip';
}
