import 'package:json_theme/json_theme_schemas.dart';

class RadioSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/radio.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/Radio-class.html',
    'type': 'object',
    'title': 'Radio',
    'additionalProperties': false,
    'properties': {
      RadioSchemaProperty.activeColor: SchemaHelper.objectSchema(ColorSchema.id),
      RadioSchemaProperty.autovalidate: SchemaHelper.boolSchema,
      RadioSchemaProperty.autovalidateMode: SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      RadioSchemaProperty.autofocus: SchemaHelper.boolSchema,
      RadioSchemaProperty.checkColor: SchemaHelper.objectSchema(ColorSchema.id),
      RadioSchemaProperty.enabled: SchemaHelper.boolSchema,
      RadioSchemaProperty.fillColor: SchemaHelper.objectSchema(MaterialStatePropertyColorSchema.id,),
      RadioSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      RadioSchemaProperty.focusNode: SchemaHelper.stringSchema,
      RadioSchemaProperty.groupValue: SchemaHelper.anySchema,
      RadioSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      RadioSchemaProperty.id: SchemaHelper.stringSchema,
      RadioSchemaProperty.label: SchemaHelper.stringSchema,
      RadioSchemaProperty.materialTapTargetSize: SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id,),
      RadioSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      RadioSchemaProperty.onChanged: SchemaHelper.stringSchema,
      RadioSchemaProperty.onSaved: SchemaHelper.stringSchema,
      RadioSchemaProperty.overlayColor: SchemaHelper.objectSchema(MaterialStatePropertyColorSchema.id,),
      RadioSchemaProperty.toggleable: SchemaHelper.boolSchema,
      RadioSchemaProperty.splashRadius: SchemaHelper.numberSchema,
      RadioSchemaProperty.validators: SchemaHelper.anySchema,
      RadioSchemaProperty.value: SchemaHelper.anySchema,
      RadioSchemaProperty.visualDensity: SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}

class RadioSchemaProperty {
  static const activeColor = 'activeColor';
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const autofocus = 'autofocus';
  static const checkColor = 'checkColor';
  static const enabled = 'enabled';
  static const fillColor = 'fillColor';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const groupValue = 'groupValue';
  static const hoverColor = 'hoverColor';
  static const id = 'id';
  static const label = 'label';
  static const materialTapTargetSize = 'materialTapTargetSize';
  static const mouseCursor = 'mouseCursor';
  static const onChanged = 'onChanged';
  static const onSaved = 'onSaved';
  static const overlayColor = 'overlayColor';
  static const toggleable = 'toggleable';
  static const splashRadius = 'splashRadius';
  static const validators = 'validators';
  static const value = 'value';
  static const visualDensity = 'visualDensity';
}