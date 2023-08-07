import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_directionality_builder.g.dart';

/// Builder that can build an [Directionality] widget.
@jsonWidget
abstract class _JsonDirectionalityBuilder extends JsonWidgetBuilder {
  const _JsonDirectionalityBuilder({
    required super.numSupportedChildren,
  });

  @override
  Directionality buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
