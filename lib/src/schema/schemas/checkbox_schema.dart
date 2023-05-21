import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';

class CheckboxSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/checkbox.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/Checkbox-class.html',
    'type': 'object',
    'title': 'Checkbox',
    'additionalProperties': false,
    'properties': {
      CheckboxSchemaProperty.activeColor: SchemaHelper.objectSchema(ColorSchema.id),
      CheckboxSchemaProperty.autofocus: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.autovalidate: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.autovalidateMode: SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      CheckboxSchemaProperty.checkColor: SchemaHelper.objectSchema(ColorSchema.id),
      CheckboxSchemaProperty.enabled: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.fillColor: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      CheckboxSchemaProperty.focusNode: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      CheckboxSchemaProperty.isError: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.label: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.materialTapTargetSize:
          SchemaHelper.objectSchema(MaterialTapTargetSizeSchema.id),
      CheckboxSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      CheckboxSchemaProperty.onChanged: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.onSaved: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.overlayColor: SchemaHelper.stringSchema,
      CheckboxSchemaProperty.shape: SchemaHelper.objectSchema(OutlinedButtonSchema.id),
      CheckboxSchemaProperty.side: SchemaHelper.objectSchema(BorderSideSchema.id),
      CheckboxSchemaProperty.splashRadius: SchemaHelper.numberSchema,
      CheckboxSchemaProperty.tristate: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.validators: {
        'type': 'array',
        'items': {
          'type': 'object',
          'additionalProperties': true,
        },
      },
      CheckboxSchemaProperty.value: SchemaHelper.boolSchema,
      CheckboxSchemaProperty.visualDensity: SchemaHelper.objectSchema(VisualDensitySchema.id),
    },
  };
}

class CheckboxSchemaProperty {
  static const activeColor = 'activeColor';
  static const autofocus = 'autofocus';
  static const autovalidate = 'autovalidate';
  static const autovalidateMode = 'autovalidateMode';
  static const checkColor = 'checkColor';
  static const enabled = 'enabled';
  static const fillColor = 'fillColor';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const hoverColor = 'hoverColor';
  static const isError = 'isError';
  static const label = 'label';
  static const materialTapTargetSize = 'materialTapTargetSize';
  static const mouseCursor = 'mouseCursor';
  static const onChanged = 'onChanged';
  static const onSaved = 'onSaved';
  static const overlayColor = 'overlayColor';
  static const shape = 'shape';
  static const side = 'side';
  static const splashRadius = 'splashRadius';
  static const tristate = 'tristate';
  static const validators = 'validators';
  static const value = 'value';
  static const visualDensity = 'visualDensity';
}
