import 'dart:ui';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_semantics_builder.g.dart';

/// Builder that can build an [Semantics] widget.
@jsonWidget
abstract class _JsonSemanticsBuilder extends JsonWidgetBuilder {
  const _JsonSemanticsBuilder({required super.args});

  @JsonArgEncoder('sortKey')
  static Map<String, dynamic>? _encodeSortKey(SemanticsSortKey? value) =>
      value is OrdinalSortKey
      ? ThemeEncoder.instance.encodeOrdinalSortKey(value)
      : null;

  @JsonArgDecoder('sortKey')
  OrdinalSortKey? _decodeSortKey({required dynamic value}) =>
      ThemeDecoder.instance.decodeOrdinalSortKey(value, validate: false);

  @JsonDefaultParam('sortKey', 'null')
  @override
  Semantics buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
