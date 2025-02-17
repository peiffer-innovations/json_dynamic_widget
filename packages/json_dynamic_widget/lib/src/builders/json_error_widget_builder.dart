import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_error_widget_builder.g.dart';

/// Builder that can build an [ErrorWidget] widget.
@jsonWidget
abstract class _JsonErrorWidgetBuilder extends JsonWidgetBuilder {
  const _JsonErrorWidgetBuilder({required super.args});

  @JsonPositionedParam('exception')
  @override
  ErrorWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
