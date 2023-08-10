// ignore: unused_import
import 'package:flutter/rendering.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_semantics_builder.g.dart';

/// Builder that can build an [Semantics] widget.
@jsonWidget
abstract class _JsonSemanticsBuilder extends JsonWidgetBuilder {
  const _JsonSemanticsBuilder();

  @override
  Semantics buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
