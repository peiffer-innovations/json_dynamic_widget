import 'package:json_theme/json_theme_schemas.dart';

class HeroSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/hero.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
    'type': 'object',
    'title': 'Hero',
    'additionalProperties': false,
    'required': [
      'tag',
    ],
    'properties': {
      HeroSchemaProperty.createRectTween: SchemaHelper.stringSchema,
      HeroSchemaProperty.flightShuttleBuilder: SchemaHelper.stringSchema,
      HeroSchemaProperty.placeholderBuilder: SchemaHelper.stringSchema,
      HeroSchemaProperty.tag: SchemaHelper.anySchema,
      HeroSchemaProperty.transitionOnUserGestures: SchemaHelper.boolSchema,
    },
  };
}

class HeroSchemaProperty {
  static const createRectTween = 'createRectTween';
  static const flightShuttleBuilder = 'flightShuttleBuilder';
  static const placeholderBuilder = 'placeholderBuilder';
  static const tag = 'tag';
  static const transitionOnUserGestures = 'transitionOnUserGestures';
}
