import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_overflow_bar_builder.g.dart';

/// Builder that can build a [OverflowBar] widget.
@jsonWidget
abstract class _JsonOverflowBarBuilder extends JsonWidgetBuilder {
  const _JsonOverflowBarBuilder({
    required super.args,
  });

  @override
  OverflowBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
