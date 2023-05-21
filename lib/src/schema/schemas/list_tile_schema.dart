import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class ListTileSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/list_tile.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/material/ListTile-class.html',
    'type': 'object',
    'title': 'ListTile',
    'additionalProperties': false,
    'properties': {
      ListTileSchemaProperty.autofocus: SchemaHelper.boolSchema,
      ListTileSchemaProperty.contentPadding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      ListTileSchemaProperty.dense: SchemaHelper.boolSchema,
      ListTileSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      ListTileSchemaProperty.enabled: SchemaHelper.boolSchema,
      ListTileSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.focusNode: SchemaHelper.stringSchema,
      ListTileSchemaProperty.horizontalTitleGap: SchemaHelper.numberSchema,
      ListTileSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.iconColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.isThreeLine: SchemaHelper.boolSchema,
      ListTileSchemaProperty.leading: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ListTileSchemaProperty.minLeadingWidth: SchemaHelper.numberSchema,
      ListTileSchemaProperty.minVerticalPadding: SchemaHelper.numberSchema,
      ListTileSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      ListTileSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      ListTileSchemaProperty.onTap: SchemaHelper.stringSchema,
      ListTileSchemaProperty.selected: SchemaHelper.boolSchema,
      ListTileSchemaProperty.selectedColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.selectedTileColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.shape: SchemaHelper.objectSchema(ShapeBorderSchema.id),
      ListTileSchemaProperty.splashColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.style: SchemaHelper.objectSchema(ListTileStyleSchema.id),
      ListTileSchemaProperty.subtitle: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ListTileSchemaProperty.textColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.tileColor: SchemaHelper.objectSchema(ColorSchema.id),
      ListTileSchemaProperty.title: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ListTileSchemaProperty.trailing: SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      ListTileSchemaProperty.visualDensity: SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}

class ListTileSchemaProperty {
  static const autofocus = 'autofocus';
  static const contentPadding = 'contentPadding';
  static const dense = 'dense';
  static const enableFeedback = 'enableFeedback';
  static const enabled = 'enabled';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const horizontalTitleGap = 'horizontalTitleGap';
  static const hoverColor = 'hoverColor';
  static const iconColor = 'iconColor';
  static const isThreeLine = 'isThreeLine';
  static const leading = 'leading';
  static const minLeadingWidth = 'minLeadingWidth';
  static const minVerticalPadding = 'minVerticalPadding';
  static const mouseCursor = 'mouseCursor';
  static const onLongPress = 'onLongPress';
  static const onTap = 'onTap';
  static const selected = 'selected';
  static const selectedColor = 'selectedColor';
  static const selectedTileColor = 'selectedTileColor';
  static const shape = 'shape';
  static const splashColor = 'splashColor';
  static const style = 'style';
  static const subtitle = 'subtitle';
  static const textColor = 'textColor';
  static const tileColor = 'tileColor';
  static const title = 'title';
  static const trailing = 'trailing';
  static const visualDensity = 'visualDensity';
}
