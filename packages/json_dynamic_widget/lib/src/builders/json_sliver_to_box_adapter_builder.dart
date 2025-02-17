import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sliver_to_box_adapter_builder.g.dart';

/// Builder that can build an [SliverToBoxAdapter] widget.
@jsonWidget
abstract class _JsonSliverToBoxAdapterBuilder extends JsonWidgetBuilder {
  const _JsonSliverToBoxAdapterBuilder({required super.args});

  @override
  SliverToBoxAdapter buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
