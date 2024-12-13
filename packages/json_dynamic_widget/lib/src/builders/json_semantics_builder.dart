import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_semantics_builder.g.dart';

/// Builder that can build an [Semantics] widget.
@jsonWidget
abstract class _JsonSemanticsBuilder extends JsonWidgetBuilder {
  const _JsonSemanticsBuilder({
    required super.args,
  });

  @JsonArgEncoder('sortKey')
  static Map<String, dynamic>? _encodeSortKey(SemanticsSortKey? value) =>
      value is OrdinalSortKey ? ThemeEncoder.encodeOrdinalSortKey(value) : null;

  @JsonArgSchema('sortKey')
  static Map<String, dynamic> _inputDecorationSchema() {
    final schema = OrdinalSortKeySchema.schema;
    SchemaCache().addSchema(OrdinalSortKeySchema.id, schema);
    return SchemaHelper.objectSchema(OrdinalSortKeySchema.id);
  }

  @JsonArgDecoder('sortKey')
  OrdinalSortKey? _decodeSortKey({required dynamic value}) =>
      ThemeDecoder.decodeOrdinalSortKey(
        value,
        validate: false,
      );

  @JsonDefaultParam('sortKey', 'null')
  @override
  Semantics buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
