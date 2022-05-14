import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class AppBarSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/app_bar.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment': 'https://api.flutter.dev/flutter/material/AppBar-class.html',
    'type': 'object',
    'title': 'AppBar',
    'additionalProperties': false,
    'properties': {
      'actions': SchemaHelper.arraySchema(JsonWidgetDataSchema.id),
      'actionsIconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'automaticallyImplyLeading': SchemaHelper.boolSchema,
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'bottom': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'bottomOpacity': SchemaHelper.numberSchema,
      'centerTitle': SchemaHelper.boolSchema,
      'elevation': SchemaHelper.numberSchema,
      'excludeHeaderSemantics': SchemaHelper.boolSchema,
      'flexibleSpace': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'foregroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconTheme': SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'leading': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'leadingWidth': SchemaHelper.numberSchema,
      'primary': SchemaHelper.boolSchema,
      'scrolledUnderElevation': SchemaHelper.boolSchema,
      'shadowColor': SchemaHelper.objectSchema(ColorSchema.id),
      'shape': SchemaHelper.objectSchema(ShapeBorderSchema.id),
      'surfaceTintColor': SchemaHelper.objectSchema(ColorSchema.id),
      'systemOverlayStyle': SchemaHelper.objectSchema(
        SystemUiOverlayStyleSchema.id,
      ),
      'titleTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'toolbarTextStyle': SchemaHelper.objectSchema(TextStyleSchema.id),
      'title': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'titleSpacing': SchemaHelper.numberSchema,
      'toolbarHeight': SchemaHelper.numberSchema,
      'toolbarOpacity': SchemaHelper.numberSchema,
    },
  };
}
