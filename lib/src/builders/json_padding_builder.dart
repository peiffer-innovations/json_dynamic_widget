import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_padding_builder.g.dart';

/// Builder that can build an [Padding] widget.
@jsonWidget
abstract class _JsonPaddingBuilder extends JsonWidgetBuilder {
  const _JsonPaddingBuilder();

  @override
  Padding buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
