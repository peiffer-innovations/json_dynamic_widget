import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scroll_configuration_builder.g.dart';

/// Builder that can build an [ScrollConfiguration] widget.
@jsonWidget
abstract class _JsonScrollConfigurationBuilder extends JsonWidgetBuilder {
  const _JsonScrollConfigurationBuilder();

  @override
  ScrollConfiguration buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
