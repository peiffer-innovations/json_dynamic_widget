import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_material_builder.g.dart';

/// Builder that can build an [Material] widget.
@jsonWidget
abstract class _JsonMaterialBuilder extends JsonWidgetBuilder {
  const _JsonMaterialBuilder({
    required super.numSupportedChildren,
  });

  @override
  Material buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
