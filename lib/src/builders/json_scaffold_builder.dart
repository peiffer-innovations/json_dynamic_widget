// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scaffold_builder.g.dart';

/// Builder that can build an [Scaffold] widget.
@jsonWidget
abstract class _JsonScaffoldBuilder extends JsonWidgetBuilder {
  const _JsonScaffoldBuilder();

  @override
  Scaffold buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
