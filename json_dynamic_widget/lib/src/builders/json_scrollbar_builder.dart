import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scrollbar_builder.g.dart';

/// Builder that can build an [Scrollbar] widget.
@jsonWidget
abstract class _JsonScrollbarBuilder extends JsonWidgetBuilder {
  const _JsonScrollbarBuilder();

  @override
  Scrollbar buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
