import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_placeholder_builder.g.dart';

/// Builder that can build an [Placeholder] widget.
@jsonWidget
abstract class _JsonPlaceholderBuilder extends JsonWidgetBuilder {
  const _JsonPlaceholderBuilder();

  @override
  Placeholder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
