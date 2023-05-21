import 'package:json_theme/json_theme_schemas.dart';

class NetworkImageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/network_image.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment':
        'https://api.flutter.dev/flutter/painting/NetworkImage-class.html',
    'type': 'object',
    'title': 'NetworkImage',
    'additionalProperties': false,
    'required': [
      'src',
    ],
    'properties': {
      NetworkImageSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      NetworkImageSchemaProperty.cacheHeight: SchemaHelper.numberSchema,
      NetworkImageSchemaProperty.cacheWidth: SchemaHelper.numberSchema,
      NetworkImageSchemaProperty.centerSlice: SchemaHelper.objectSchema(RectSchema.id),
      NetworkImageSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      NetworkImageSchemaProperty.colorBlendMode: SchemaHelper.objectSchema(BlendModeSchema.id),
      NetworkImageSchemaProperty.errorBuilder: SchemaHelper.stringSchema,
      NetworkImageSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      NetworkImageSchemaProperty.filterQuality: SchemaHelper.objectSchema(FilterQualitySchema.id),
      NetworkImageSchemaProperty.fit: SchemaHelper.objectSchema(BoxFitSchema.id),
      NetworkImageSchemaProperty.frameBuilder: SchemaHelper.stringSchema,
      NetworkImageSchemaProperty.gaplessPlayback: SchemaHelper.boolSchema,
      NetworkImageSchemaProperty.height: SchemaHelper.numberSchema,
      NetworkImageSchemaProperty.headers: SchemaHelper.anySchema,
      NetworkImageSchemaProperty.isAntiAlias: SchemaHelper.boolSchema,
      NetworkImageSchemaProperty.loadingBuilder: SchemaHelper.stringSchema,
      NetworkImageSchemaProperty.matchTextDirection: SchemaHelper.boolSchema,
      NetworkImageSchemaProperty.opacity: SchemaHelper.numberSchema,
      NetworkImageSchemaProperty.repeat: SchemaHelper.objectSchema(ImageRepeatSchema.id),
      NetworkImageSchemaProperty.scale: SchemaHelper.numberSchema,
      NetworkImageSchemaProperty.semanticLabel: SchemaHelper.stringSchema,
      NetworkImageSchemaProperty.src: SchemaHelper.stringSchema,
      NetworkImageSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class NetworkImageSchemaProperty {
  static const alignment = 'alignment';
  static const cacheHeight = 'cacheHeight';
  static const cacheWidth = 'cacheWidth';
  static const centerSlice = 'centerSlice';
  static const color = 'color';
  static const colorBlendMode = 'colorBlendMode';
  static const errorBuilder = 'errorBuilder';
  static const excludeFromSemantics = 'excludeFromSemantics';
  static const filterQuality = 'filterQuality';
  static const fit = 'fit';
  static const frameBuilder = 'frameBuilder';
  static const gaplessPlayback = 'gaplessPlayback';
  static const height = 'height';
  static const headers = 'headers';
  static const isAntiAlias = 'isAntiAlias';
  static const loadingBuilder = 'loadingBuilder';
  static const matchTextDirection = 'matchTextDirection';
  static const opacity = 'opacity';
  static const repeat = 'repeat';
  static const scale = 'scale';
  static const semanticLabel = 'semanticLabel';
  static const src = 'src';
  static const width = 'width';
}