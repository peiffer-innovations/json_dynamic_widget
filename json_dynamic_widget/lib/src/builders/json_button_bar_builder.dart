import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_button_bar_builder.g.dart';

/// Builder that can build a [ButtonBar] widget.
@jsonWidget
abstract class _JsonButtonBarBuilder extends JsonWidgetBuilder {
  const _JsonButtonBarBuilder();

  @override
  ButtonBar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
