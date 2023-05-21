import 'package:json_theme/json_theme_schemas.dart';

class MemoryImageSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/memory_image.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment': 'https://api.flutter.dev/flutter/painting/MemoryImage-class.html',
    'type': 'object',
    'title': 'MemoryImage',
    'additionalProperties': false,
    'required': [
      'image',
    ],
    'properties': {
      MemoryImageSchemaProperty.alignment: SchemaHelper.objectSchema(AlignmentSchema.id),
      MemoryImageSchemaProperty.cacheHeight: SchemaHelper.numberSchema,
      MemoryImageSchemaProperty.cacheWidth: SchemaHelper.numberSchema,
      MemoryImageSchemaProperty.centerSlice: SchemaHelper.objectSchema(RectSchema.id),
      MemoryImageSchemaProperty.color: SchemaHelper.objectSchema(ColorSchema.id),
      MemoryImageSchemaProperty.colorBlendMode: SchemaHelper.objectSchema(BlendModeSchema.id),
      MemoryImageSchemaProperty.errorBuilder: SchemaHelper.stringSchema,
      MemoryImageSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      MemoryImageSchemaProperty.filterQuality: SchemaHelper.objectSchema(FilterQualitySchema.id),
      MemoryImageSchemaProperty.fit: SchemaHelper.objectSchema(BoxFitSchema.id),
      MemoryImageSchemaProperty.frameBuilder: SchemaHelper.stringSchema,
      MemoryImageSchemaProperty.gaplessPlayback: SchemaHelper.boolSchema,
      MemoryImageSchemaProperty.height: SchemaHelper.numberSchema,
      MemoryImageSchemaProperty.image: SchemaHelper.anySchema,
      MemoryImageSchemaProperty.isAntiAlias: SchemaHelper.boolSchema,
      MemoryImageSchemaProperty.matchTextDirection: SchemaHelper.boolSchema,
      MemoryImageSchemaProperty.opacity: SchemaHelper.numberSchema,
      MemoryImageSchemaProperty.repeat: SchemaHelper.objectSchema(ImageRepeatSchema.id),
      MemoryImageSchemaProperty.scale: SchemaHelper.numberSchema,
      MemoryImageSchemaProperty.semanticLabel: SchemaHelper.stringSchema,
      MemoryImageSchemaProperty.width: SchemaHelper.numberSchema,
    },
  };
}

class MemoryImageSchemaProperty {
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
  static const image = 'image';
  static const isAntiAlias = 'isAntiAlias';
  static const matchTextDirection = 'matchTextDirection';
  static const opacity = 'opacity';
  static const repeat = 'repeat';
  static const scale = 'scale';
  static const semanticLabel = 'semanticLabel';
  static const width = 'width';
}
