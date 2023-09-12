import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_row_builder.g.dart';

/// Builder that can build an [Row] widget.
@jsonWidget
abstract class _JsonRowBuilder extends JsonWidgetBuilder {
  const _JsonRowBuilder({
    required super.args,
  });

  @override
  Row buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
