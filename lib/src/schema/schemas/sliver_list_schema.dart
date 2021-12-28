import 'package:json_theme/json_theme_schemas.dart';

class SliverListSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/sliver_list.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://api.flutter.dev/flutter/widgets/SliverList-class.html',
    'title': 'SliverList',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'addAutomaticKeepAlives': SchemaHelper.boolSchema,
      'addRepaintBoundaries': SchemaHelper.boolSchema,
      'addSemanticIndexes': SchemaHelper.boolSchema,
      'findChildIndexCallback': SchemaHelper.stringSchema,
      'semanticIndexCallback': SchemaHelper.stringSchema,
      'semanticIndexOffset': SchemaHelper.numberSchema,
    },
  };
}
