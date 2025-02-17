import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_fitted_box_builder.g.dart';

/// Builder that can build an [FittedBox] widget.
@jsonWidget
abstract class _JsonFittedBoxBuilder extends JsonWidgetBuilder {
  const _JsonFittedBoxBuilder({required super.args});

  @override
  FittedBox buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
