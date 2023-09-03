import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_builder.g.dart';

/// Builder that can build an [Text] widget.
@jsonWidget
abstract class _JsonTextBuilder extends JsonWidgetBuilder {
  const _JsonTextBuilder({
    required super.args,
  });

  @JsonArgDecoder('text')
  String _decodeText({required dynamic value}) => value?.toString() ?? '';

  @JsonPositionedParam('data')
  @JsonArgAlias(alias: 'text', name: 'data')
  @override
  Text buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
