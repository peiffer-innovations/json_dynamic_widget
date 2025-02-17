import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_opacity_builder.g.dart';

/// Builder that can build an [Opacity] widget.
@jsonWidget
abstract class _JsonOpacityBuilder extends JsonWidgetBuilder {
  const _JsonOpacityBuilder({required super.args});

  @override
  Opacity buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
