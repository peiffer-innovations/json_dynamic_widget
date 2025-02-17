import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_no_op_builder.g.dart';

/// Builder that can build an widget that does nothing.
@jsonWidget
abstract class _JsonNoOpBuilder extends JsonWidgetBuilder {
  const _JsonNoOpBuilder({required super.args});

  @override
  _NoOp buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _NoOp extends StatelessWidget {
  const _NoOp({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox();
}
