import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class DropdownButtonFormFieldSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/dropdown_button_form_field';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'DropdownButtonFormFieldBuilder',
    'additionalProperties': false,
    'properties': {
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'decoration': SchemaHelper.anySchema,
      'disabledHint': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'dropdownColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'hint': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'items': SchemaHelper.anySchema,
      'iconDisabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconEnabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconSize': SchemaHelper.numberSchema,
      'isDense': SchemaHelper.boolSchema,
      'isExpanded': SchemaHelper.boolSchema,
      'itemHeight': SchemaHelper.numberSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selectedItemBuilder': SchemaHelper.anySchema,
      'validators': SchemaHelper.anySchema,
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'value': SchemaHelper.anySchema,
    },
  };
}
