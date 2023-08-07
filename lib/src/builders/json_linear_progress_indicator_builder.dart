import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_linear_progress_indicator_builder.g.dart';

/// Builder that can build an [LinearProgressIndicator] widget.
@jsonWidget
abstract class _JsonLinearProgressIndicatorBuilder extends JsonWidgetBuilder {
  const _JsonLinearProgressIndicatorBuilder({
    required super.numSupportedChildren,
  });

  @override
  LinearProgressIndicator buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
