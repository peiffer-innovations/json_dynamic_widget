import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class DropdownButtonFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dropdown_button_form_field.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html',
    'type': 'object',
    'title': 'DropdownButtonFormField',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'decoration': SchemaHelper.anySchema,
      'disabledHint': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'dropdownColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enableFeedback': SchemaHelper.boolSchema,
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
      'menuMaxHeight': SchemaHelper.boolSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selectedItemBuilder': SchemaHelper.anySchema,
      'shadows': SchemaHelper.arraySchema(ShadowSchema.id),
      'validators': SchemaHelper.anySchema,
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'value': SchemaHelper.anySchema,
    },
  };
}
