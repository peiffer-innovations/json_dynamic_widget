import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_indexed_stack_builder.g.dart';

/// Builder that can build an [IndexedStack] widget.
@jsonWidget
abstract class _JsonIndexedStackBuilder extends JsonWidgetBuilder {
  const _JsonIndexedStackBuilder({
    required super.args,
  });

  @override
  IndexedStack buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
