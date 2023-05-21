import 'package:json_theme/json_theme_schemas.dart';

class SliverListSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/sliver_list.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/SliverList-class.html',
    'title': 'SliverList',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      SilverListSchemaProperty.addAutomaticKeepAlives: SchemaHelper.boolSchema,
      SilverListSchemaProperty.addRepaintBoundaries: SchemaHelper.boolSchema,
      SilverListSchemaProperty.addSemanticIndexes: SchemaHelper.boolSchema,
      SilverListSchemaProperty.findChildIndexCallback: SchemaHelper.stringSchema,
      SilverListSchemaProperty.semanticIndexCallback: SchemaHelper.stringSchema,
      SilverListSchemaProperty.semanticIndexOffset: SchemaHelper.numberSchema,
    },
  };
}

class SilverListSchemaProperty {
  static const addAutomaticKeepAlives = 'addAutomaticKeepAlives';
  static const addRepaintBoundaries = 'addRepaintBoundaries';
  static const addSemanticIndexes = 'addSemanticIndexes';
  static const findChildIndexCallback = 'findChildIndexCallback';
  static const semanticIndexCallback = 'semanticIndexCallback';
  static const semanticIndexOffset = 'semanticIndexOffset';
}