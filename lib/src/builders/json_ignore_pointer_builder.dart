import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_ignore_pointer_builder.g.dart';

/// Builder that can build an [IgnorePointer] widget.
@jsonWidget
abstract class _JsonIgnorePointerBuilder extends JsonWidgetBuilder {
  const _JsonIgnorePointerBuilder({
    required super.numSupportedChildren,
  });

  @override
  IgnorePointer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
