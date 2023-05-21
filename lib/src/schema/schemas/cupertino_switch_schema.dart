import 'package:json_theme/json_theme_schemas.dart';

class CupertinoSwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/cupertino_switch.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/cupertino/CupertinoSwitch-class.html',
    'type': 'object',
    'title': 'CupertinoSwitch',
    'additionalProperties': false,
    'properties': {
      CurpentinoSwitchSchemaProperty.activeColor: SchemaHelper.objectSchema(ColorSchema.id),
      CurpentinoSwitchSchemaProperty.autovalidate: SchemaHelper.boolSchema,
      CurpentinoSwitchSchemaProperty.autovalidateMode:
          SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      CurpentinoSwitchSchemaProperty.dragStartBehavior:
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      CurpentinoSwitchSchemaProperty.enabled: SchemaHelper.boolSchema,
      CurpentinoSwitchSchemaProperty.label: SchemaHelper.stringSchema,
      CurpentinoSwitchSchemaProperty.onChanged: SchemaHelper.stringSchema,
      CurpentinoSwitchSchemaProperty.onSaved: SchemaHelper.stringSchema,
      CurpentinoSwitchSchemaProperty.restorationId: SchemaHelper.stringSchema,
      CurpentinoSwitchSchemaProperty.thumbColor: SchemaHelper.objectSchema(ColorSchema.id),
      CurpentinoSwitchSchemaProperty.trackColor: SchemaHelper.objectSchema(ColorSchema.id),
      CurpentinoSwitchSchemaProperty.validators: {
        'type': 'array',
        'items': {
          'type': 'object',
          'additionalProperties': true,
        }
      },
      'value': SchemaHelper.boolSchema,
      'visualDensity': SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}

class CurpentinoSwitchSchemaProperty {
  static const activeColor = 'activeColor';
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const dragStartBehavior = 'dragStartBehavior';
  static const enabled = 'enabled';
  static const label = 'label';
  static const onChanged = 'onChanged';
  static const onSaved = 'onSaved';
  static const restorationId = 'restorationId';
  static const thumbColor = 'thumbColor';
  static const trackColor = 'trackColor';
  static const validators = 'validators';
  static const value = 'value';
  static const visualDensity = 'visualDensity';
}
