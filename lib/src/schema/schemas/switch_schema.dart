import 'package:json_theme/json_theme_schemas.dart';

class SwitchSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/switch.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/material/Switch-class.html',
    'type': 'object',
    'title': 'Switch',
    'additionalProperties': false,
    'properties': {
      SwitchSchemaProperty.activeColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.activeThumbImage: SchemaHelper.objectSchema(ImageProviderSchema.id),
      SwitchSchemaProperty.activeTrackColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.autofocus: SchemaHelper.boolSchema,
      SwitchSchemaProperty.autovalidateMode: SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      SwitchSchemaProperty.dragStartBehavior: SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      SwitchSchemaProperty.enabled: SchemaHelper.boolSchema,
      SwitchSchemaProperty.focusColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.focusNode: SchemaHelper.stringSchema,
      SwitchSchemaProperty.hoverColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.inactiveThumbColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.inactiveThumbImage: SchemaHelper.objectSchema(ImageProviderSchema.id),
      SwitchSchemaProperty.inactiveTrackColor: SchemaHelper.objectSchema(ColorSchema.id),
      SwitchSchemaProperty.label: SchemaHelper.stringSchema,
      SwitchSchemaProperty.materialTapTargetSize: SchemaHelper.objectSchema(
        MaterialTapTargetSizeSchema.id,
      ),
      SwitchSchemaProperty.mouseCursor: SchemaHelper.objectSchema(MouseCursorSchema.id),
      SwitchSchemaProperty.onActiveThumbImageError: SchemaHelper.stringSchema,
      SwitchSchemaProperty.onChanged: SchemaHelper.stringSchema,
      SwitchSchemaProperty.onInactiveThumbImageError: SchemaHelper.stringSchema,
      SwitchSchemaProperty.onSaved: SchemaHelper.stringSchema,
      SwitchSchemaProperty.overlayColor: SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      SwitchSchemaProperty.splashRadius: SchemaHelper.numberSchema,
      SwitchSchemaProperty.thumbColor: SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      SwitchSchemaProperty.thumbIcon: SchemaHelper.objectSchema(
        MaterialStatePropertyIconSchema.id,
      ),
      SwitchSchemaProperty.trackColor: SchemaHelper.objectSchema(
        MaterialStatePropertyColorSchema.id,
      ),
      SwitchSchemaProperty.validators: SchemaHelper.anySchema,
      SwitchSchemaProperty.value: SchemaHelper.boolSchema,
      SwitchSchemaProperty.visualDensity: SchemaHelper.objectSchema(VisualDensitySchema.id),
    }
  };
}

class SwitchSchemaProperty {
  static const activeColor = 'activeColor';
  static const activeThumbImage = 'activeThumbImage';
  static const activeTrackColor = 'activeTrackColor';
  static const autofocus = 'autofocus';
  static const autovalidateMode = 'autovalidateMode';
  static const dragStartBehavior = 'dragStartBehavior';
  static const enabled = 'enabled';
  static const focusColor = 'focusColor';
  static const focusNode = 'focusNode';
  static const hoverColor = 'hoverColor';
  static const inactiveThumbColor = 'inactiveThumbColor';
  static const inactiveThumbImage = 'inactiveThumbImage';
  static const inactiveTrackColor = 'inactiveTrackColor';
  static const label = 'label';
  static const materialTapTargetSize = 'materialTapTargetSize';
  static const mouseCursor = 'mouseCursor';
  static const onActiveThumbImageError = 'onActiveThumbImageError';
  static const onChanged = 'onChanged';
  static const onInactiveThumbImageError = 'onInactiveThumbImageError';
  static const onSaved = 'onSaved';
  static const overlayColor = 'overlayColor';
  static const splashRadius = 'splashRadius';
  static const thumbColor = 'thumbColor';
  static const thumbIcon = 'thumbIcon';
  static const trackColor = 'trackColor';
  static const validators = 'validators';
  static const value = 'value';
  static const visualDensity = 'visualDensity';
}
