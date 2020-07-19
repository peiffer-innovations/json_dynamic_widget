import 'package:json_theme/json_theme_schemas.dart';

class ButtonBarSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/button_bar';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'title': 'ButtonBarBuilder',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
      'buttonAlignedDropdown': SchemaHelper.boolSchema,
      'buttonHeight': SchemaHelper.numberSchema,
      'buttonMinWidth': SchemaHelper.numberSchema,
      'buttonPadding': SchemaHelper.objectSchema(EdgeInsetsGeometrySchema.id),
      'buttonTextTheme': SchemaHelper.objectSchema(ButtonTextThemeSchema.id),
      'layoutBehavior':
          SchemaHelper.objectSchema(ButtonBarLayoutBehaviorSchema.id),
      'mainAxisSize': SchemaHelper.objectSchema(MainAxisSizeSchema.id),
      'overflowButtonSpacing': SchemaHelper.numberSchema,
      'overflowDirection':
          SchemaHelper.objectSchema(VerticalDirectionSchema.id),
    },
  };
}
