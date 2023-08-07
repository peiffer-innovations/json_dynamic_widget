import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_decorated_box_builder.g.dart';

/// Builder that can build an [DecoratedBox] widget.
@jsonWidget
abstract class _JsonDecoratedBoxBuilder extends JsonWidgetBuilder {
  const _JsonDecoratedBoxBuilder({
    required super.numSupportedChildren,
  });

  @override
  DecoratedBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
