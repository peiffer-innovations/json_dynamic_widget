import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sliver_padding_builder.g.dart';

/// Builder that can build an [SliverPadding] widget.
@jsonWidget
abstract class _JsonSliverPaddingBuilder extends JsonWidgetBuilder {
  const _JsonSliverPaddingBuilder({required super.args});

  @JsonArgAlias(alias: 'child', name: 'sliver')
  @override
  SliverPadding buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
