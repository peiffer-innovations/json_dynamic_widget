import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_flexible_builder.g.dart';

/// Builder that can build an [Flexible] widget.
@jsonWidget
abstract class _JsonFlexibleBuilder extends JsonWidgetBuilder {
  const _JsonFlexibleBuilder();

  @override
  Flexible buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
