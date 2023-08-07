import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_input_error_builder.g.dart';

/// Builder that can build an [InputError] widget.
@jsonWidget
abstract class _JsonInputErrorBuilder extends JsonWidgetBuilder {
  const _JsonInputErrorBuilder({
    required super.numSupportedChildren,
  });

  @override
  InputError buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
