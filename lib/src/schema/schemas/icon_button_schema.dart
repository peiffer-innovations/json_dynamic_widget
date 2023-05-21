import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class IconButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/icon_button.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/IconButton-class.html',
    'type': 'object',
    'title': 'IconButton',
    'additionalProperties': false,
    'properties': {
      IconButtonSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      IconButtonSchemaProperty.autofocus: SchemaHelper.boolSchema,
      IconButtonSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.constraints: SchemaHelper.objectSchema(BoxConstraintsSchema.id),
      IconButtonSchemaProperty.disabledColor: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      IconButtonSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.focusNode: SchemaHelper.anySchema,
      IconButtonSchemaProperty.highlightColor: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.icon: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      IconButtonSchemaProperty.iconSize: SchemaHelper.numberSchema,
      IconButtonSchemaProperty.isSelected: SchemaHelper.boolSchema,
      IconButtonSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      IconButtonSchemaProperty.onPressed: SchemaHelper.anySchema,
      IconButtonSchemaProperty.padding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      IconButtonSchemaProperty.selectedIcon: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      IconButtonSchemaProperty.splashColor: SchemaHelper.objectSchema(ColorSchema.id),
      IconButtonSchemaProperty.splashRadius: SchemaHelper.numberSchema,
      IconButtonSchemaProperty.style: SchemaHelper.objectSchema(ButtonStyleSchema.id),
      IconButtonSchemaProperty.tooltip: SchemaHelper.stringSchema,
      IconButtonSchemaProperty.visualDensity: SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}

class IconButtonSchemaProperty {
  static const alignment = 'alignment';
  static const autofocus = 'autofocus';
  static const color = 'color';
  static const constraints = 'constraints';
  static const disabledColor = 'disabledColor';
  static const enableFeedback = 'enableFeedback';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const highlightColor = 'highlightColor';
  static const hoverColor = 'hoverColor';
  static const icon = 'icon';
  static const iconSize = 'iconSize';
  static const isSelected = 'isSelected';
  static const mouseCursor = 'mouseCursor';
  static const onPressed = 'onPressed';
  static const padding = 'padding';
  static const selectedIcon = 'selectedIcon';
  static const splashColor = 'splashColor';
  static const splashRadius = 'splashRadius';
  static const style = 'style';
  static const tooltip = 'tooltip';
  static const visualDensity = 'visualDensity';
}
