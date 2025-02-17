import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_card_builder.g.dart';

/// Builder that can build a [Card] widget.
@jsonWidget
abstract class _JsonCardBuilder extends JsonWidgetBuilder {
  const _JsonCardBuilder({required super.args});

  @override
  Card buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
