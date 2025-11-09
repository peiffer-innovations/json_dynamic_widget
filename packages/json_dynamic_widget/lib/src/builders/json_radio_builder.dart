import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_radio_builder.g.dart';

@JsonWidget(requiresId: true)
abstract class _JsonRadioBuilder extends JsonWidgetBuilder {
  const _JsonRadioBuilder({required super.args});

  @override
  Radio buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
