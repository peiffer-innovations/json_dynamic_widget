import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_column_builder.g.dart';

/// Builder that can build an [Column] widget.
@jsonWidget
abstract class _JsonColumnBuilder extends JsonWidgetBuilder {
  const _JsonColumnBuilder({required super.args});

  @override
  Column buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
