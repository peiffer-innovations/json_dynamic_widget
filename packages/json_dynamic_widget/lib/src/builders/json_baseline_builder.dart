import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_baseline_builder.g.dart';

/// Builder that can build a [Baseline] widget.
@jsonWidget
abstract class _JsonBaselineBuilder extends JsonWidgetBuilder {
  const _JsonBaselineBuilder({required super.args});

  @override
  Baseline buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
