// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_single_child_scroll_view_builder.g.dart';

/// Builder that can build an [SingleChildScrollView] widget.
@jsonWidget
abstract class _JsonSingleChildScrollViewBuilder extends JsonWidgetBuilder {
  const _JsonSingleChildScrollViewBuilder();

  @override
  SingleChildScrollView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
