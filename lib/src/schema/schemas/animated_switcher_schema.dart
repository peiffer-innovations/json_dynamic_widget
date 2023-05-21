import 'package:json_theme/json_theme_schemas.dart';

class AnimatedSwitcherSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/animated_switcher.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
    'type': 'object',
    'title': 'AnimatedSwitcher',
    'additionalProperties': false,
    'required': [
      'child',
      'duration',
    ],
    'properties': {
      AnimatedSwitcherSchemaProperty.child: SchemaHelper.stringSchema,
      AnimatedSwitcherSchemaProperty.duration: SchemaHelper.numberSchema,
      AnimatedSwitcherSchemaProperty.layoutBuilder: SchemaHelper.stringSchema,
      AnimatedSwitcherSchemaProperty.reverseDuration: SchemaHelper.numberSchema,
      AnimatedSwitcherSchemaProperty.switchInCurve: SchemaHelper.stringSchema,
      AnimatedSwitcherSchemaProperty.switchOutCurve: SchemaHelper.stringSchema,
      AnimatedSwitcherSchemaProperty.transitionBuilder: SchemaHelper.stringSchema,
    },
  };
}

class AnimatedSwitcherSchemaProperty {
  static const child = 'child';
  static const duration = 'duration';
  static const layoutBuilder = 'layoutBuilder';
  static const reverseDuration = 'reverseDuration';
  static const switchInCurve = 'switchInCurve';
  static const switchOutCurve = 'switchOutCurve';
  static const transitionBuilder = 'transitionBuilder';
}
