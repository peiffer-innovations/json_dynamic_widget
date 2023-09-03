import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_expanded_builder.g.dart';

/// Builder that can build an [Expanded] widget.
@jsonWidget
abstract class _JsonExpandedBuilder extends JsonWidgetBuilder {
  const _JsonExpandedBuilder({
    required super.args,
  });

  @override
  Expanded buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
