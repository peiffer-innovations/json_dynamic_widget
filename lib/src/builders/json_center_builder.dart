import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_center_builder.g.dart';

/// Builder that can build a [Center] widget.
@jsonWidget
abstract class _JsonCenterBuilder extends JsonWidgetBuilder {
  const _JsonCenterBuilder({
    required super.numSupportedChildren,
  });

  @override
  Center buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
