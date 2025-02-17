import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_icon_builder.g.dart';

/// Builder that can build an [Icon] widget.
@jsonWidget
abstract class _JsonIconBuilder extends JsonWidgetBuilder {
  const _JsonIconBuilder({required super.args});

  @override
  @JsonPositionedParam('icon')
  @JsonSchemaName('WrappedIconSchema')
  Icon buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
