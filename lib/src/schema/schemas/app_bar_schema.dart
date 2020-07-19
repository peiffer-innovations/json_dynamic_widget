import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class AppBarSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/app_bar';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'AppBarBuilder',
    'additionalProperties': false,
    'properties': {
      'actions': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'actionsIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'bottom': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomOpacity': SchemaHelper.numberSchema,
      'brightness': SchemaHelper.objectSchema(BrightnessSchema.id),
      'centerTitle': SchemaHelper.boolSchema,
      'elevation': SchemaHelper.numberSchema,
      'excludeHeaderSemantics': SchemaHelper.boolSchema,
      'flexibleSpace': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'iconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'leading': SchemaHelper.boolSchema,
      'primary': SchemaHelper.boolSchema,
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'textTheme': SchemaHelper.objectSchema(TextThemeSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'titleSpacing': SchemaHelper.numberSchema,
      'toolbarOpacity': SchemaHelper.numberSchema,
    },
  };
}
