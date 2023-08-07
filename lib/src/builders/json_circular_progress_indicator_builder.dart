import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_circular_progress_indicator_builder.g.dart';

/// Builder that can build a [CircularProgressIndicator] widget.
@jsonWidget
abstract class _JsonCircularProgressIndicatorBuilder extends JsonWidgetBuilder {
  const _JsonCircularProgressIndicatorBuilder({
    required super.numSupportedChildren,
  });

  @override
  CircularProgressIndicator buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
