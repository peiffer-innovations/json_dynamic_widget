import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_limited_box_builder.g.dart';

/// Builder that can build an [LimitedBox] widget.
@jsonWidget
abstract class _JsonLimitedBoxBuilder extends JsonWidgetBuilder {
  const _JsonLimitedBoxBuilder({
    required super.args,
  });

  @override
  LimitedBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
