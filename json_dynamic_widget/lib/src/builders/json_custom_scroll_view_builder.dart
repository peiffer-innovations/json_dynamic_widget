// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_custom_scroll_view_builder.g.dart';

/// Builder that can build an [CustomScrollView] widget.
@jsonWidget
abstract class _JsonCustomScrollViewBuilder extends JsonWidgetBuilder {
  const _JsonCustomScrollViewBuilder();

  @JsonArgAlias(alias: 'children', name: 'slivers')
  @override
  CustomScrollView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
