import 'package:json_theme/json_theme_schemas.dart';

class ButtonBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/button_bar.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment':
        'https://api.flutter.dev/flutter/material/ButtonBar-class.html',
    'title': 'ButtonBar',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      ButtonBarSchemaProperty.alignment: SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
      ButtonBarSchemaProperty.buttonAlignedDropdown: SchemaHelper.boolSchema,
      ButtonBarSchemaProperty.buttonHeight: SchemaHelper.numberSchema,
      ButtonBarSchemaProperty.buttonMinWidth: SchemaHelper.numberSchema,
      ButtonBarSchemaProperty.buttonPadding: SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      ButtonBarSchemaProperty.buttonTextTheme: SchemaHelper.objectSchema(ButtonTextThemeSchema.id),
      ButtonBarSchemaProperty.layoutBehavior: SchemaHelper.objectSchema(ButtonBarLayoutBehaviorSchema.id),
      ButtonBarSchemaProperty.mainAxisSize: SchemaHelper.objectSchema(MainAxisSizeSchema.id),
      ButtonBarSchemaProperty.overflowButtonSpacing: SchemaHelper.numberSchema,
      ButtonBarSchemaProperty.overflowDirection: SchemaHelper.objectSchema(VerticalDirectionSchema.id),
    },
  };
}

class ButtonBarSchemaProperty {
  static const alignment = 'alignment';
  static const buttonAlignedDropdown = 'buttonAlignedDropdown';
  static const buttonHeight = 'buttonHeight';
  static const buttonMinWidth = 'buttonMinWidth';
  static const buttonPadding = 'buttonPadding';
  static const buttonTextTheme = 'buttonTextTheme';
  static const layoutBehavior = 'layoutBehavior';
  static const mainAxisSize = 'mainAxisSize';
  static const overflowButtonSpacing = 'overflowButtonSpacing';
  static const overflowDirection = 'overflowDirection';
}