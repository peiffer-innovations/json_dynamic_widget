// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_grid_view_builder.g.dart';

/// Builder that can build an [GridView] widget.
@jsonWidget
abstract class _JsonGridViewBuilder extends JsonWidgetBuilder {
  const _JsonGridViewBuilder({
    required super.numSupportedChildren,
  });

  @override
  GridView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
