import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_safe_area_builder.g.dart';

/// Builder that can build an [SafeArea] widget.
@jsonWidget
abstract class _JsonSafeAreaBuilder extends JsonWidgetBuilder {
  const _JsonSafeAreaBuilder();

  @override
  SafeArea buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
