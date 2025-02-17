import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_list_tile_builder.g.dart';

/// Builder that can build an [ListTile] widget.
@jsonWidget
abstract class _JsonListTileBuilder extends JsonWidgetBuilder {
  const _JsonListTileBuilder({required super.args});

  @override
  ListTile buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
