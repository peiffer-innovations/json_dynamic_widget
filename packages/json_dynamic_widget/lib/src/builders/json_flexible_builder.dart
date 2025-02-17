import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_flexible_builder.g.dart';

/// Builder that can build an [Flexible] widget.
@jsonWidget
abstract class _JsonFlexibleBuilder extends JsonWidgetBuilder {
  const _JsonFlexibleBuilder({required super.args});

  @override
  Flexible buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
