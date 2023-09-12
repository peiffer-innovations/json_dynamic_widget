import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_container_builder.g.dart';

/// Builder that can build an [Container] widget.
@jsonWidget
abstract class _JsonContainerBuilder extends JsonWidgetBuilder {
  const _JsonContainerBuilder({
    required super.args,
  });

  @JsonArgDecoder('decoration')
  Decoration? _decodeDecoration({required dynamic value}) =>
      ThemeDecoder.decodeBoxDecoration(
        value,
        validate: false,
      );

  @JsonArgDecoder('foregroundDecoration')
  Decoration? _decodeForegroundDecoration({required dynamic value}) =>
      ThemeDecoder.decodeBoxDecoration(
        value,
        validate: false,
      );

  @override
  Container buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
