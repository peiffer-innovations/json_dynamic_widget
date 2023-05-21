import 'package:json_dynamic_widget/src/schema/all.dart';
import 'package:json_theme/json_theme_schemas.dart';

class DropdownButtonFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dropdown_button_form_field.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html',
    'type': 'object',
    'title': 'DropdownButtonFormField',
    'additionalProperties': false,
    'properties': {
      DropdownButtonFormFieldSchemaProperty.alignment:
          SchemaHelper.objectSchema(AlignmentSchema.id),
      DropdownButtonFormFieldSchemaProperty.autofocus: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.autovalidate: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.autovalidateMode:
          SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      DropdownButtonFormFieldSchemaProperty.borderRadius:
          SchemaHelper.objectSchema(BorderRadiusSchema.id),
      DropdownButtonFormFieldSchemaProperty.decoration: SchemaHelper.anySchema,
      DropdownButtonFormFieldSchemaProperty.disabledHint:
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      DropdownButtonFormFieldSchemaProperty.dropdownColor:
          SchemaHelper.objectSchema(ColorSchema.id),
      DropdownButtonFormFieldSchemaProperty.elevation: SchemaHelper.numberSchema,
      DropdownButtonFormFieldSchemaProperty.enableFeedback: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.enabled: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      DropdownButtonFormFieldSchemaProperty.focusNode: SchemaHelper.stringSchema,
      DropdownButtonFormFieldSchemaProperty.hint:
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      DropdownButtonFormFieldSchemaProperty.icon:
          SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      DropdownButtonFormFieldSchemaProperty.items: SchemaHelper.anySchema,
      DropdownButtonFormFieldSchemaProperty.iconDisabledColor:
          SchemaHelper.objectSchema(ColorSchema.id),
      DropdownButtonFormFieldSchemaProperty.iconEnabledColor:
          SchemaHelper.objectSchema(ColorSchema.id),
      DropdownButtonFormFieldSchemaProperty.iconSize: SchemaHelper.numberSchema,
      DropdownButtonFormFieldSchemaProperty.isDense: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.isExpanded: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.itemHeight: SchemaHelper.numberSchema,
      DropdownButtonFormFieldSchemaProperty.menuMaxHeight: SchemaHelper.boolSchema,
      DropdownButtonFormFieldSchemaProperty.onChanged: SchemaHelper.stringSchema,
      DropdownButtonFormFieldSchemaProperty.onSaved: SchemaHelper.stringSchema,
      DropdownButtonFormFieldSchemaProperty.onTap: SchemaHelper.stringSchema,
      DropdownButtonFormFieldSchemaProperty.selectedItemBuilder: SchemaHelper.anySchema,
      DropdownButtonFormFieldSchemaProperty.shadows: SchemaHelper.arraySchema(ShadowSchema.id),
      DropdownButtonFormFieldSchemaProperty.validators: SchemaHelper.anySchema,
      DropdownButtonFormFieldSchemaProperty.style: SchemaHelper.objectSchema(TextStyleSchema.id),
      DropdownButtonFormFieldSchemaProperty.value: SchemaHelper.anySchema,
    },
  };
}

class DropdownButtonFormFieldSchemaProperty {
  static const alignment = 'alignment';
  static const autofocus = 'autofocus';
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const borderRadius = 'borderRadius';
  static const decoration = 'decoration';
  static const disabledHint = 'disabledHint';
  static const dropdownColor = 'dropdownColor';
  static const elevation = 'elevation';
  static const enableFeedback = 'enableFeedback';
  static const enabled = 'enabled';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const hint = 'hint';
  static const icon = 'icon';
  static const iconDisabledColor = 'iconDisabledColor';
  static const iconEnabledColor = 'iconEnabledColor';
  static const iconSize = 'iconSize';
  static const isDense = 'isDense';
  static const isExpanded = 'isExpanded';
  static const itemHeight = 'itemHeight';
  static const items = 'items';
  static const menuMaxHeight = 'menuMaxHeight';
  static const onChanged = 'onChanged';
  static const onSaved = 'onSaved';
  static const onTap = 'onTap';
  static const selectedItemBuilder = 'selectedItemBuilder';
  static const shadows = 'shadows';
  static const style = 'style';
  static const validators = 'validators';
  static const value = 'value';
}
