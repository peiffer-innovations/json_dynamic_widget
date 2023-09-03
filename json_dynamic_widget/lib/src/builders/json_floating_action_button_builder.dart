import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_floating_action_button_builder.g.dart';

/// Builder that can build an [FloatingActionButton] widget.
@jsonWidget
abstract class _JsonFloatingActionButtonBuilder extends JsonWidgetBuilder {
  const _JsonFloatingActionButtonBuilder({
    required super.args,
  });

  @JsonArgEncoder('heroTag')
  static String _encodeHeroTag(dynamic value) => value.toString();

  @JsonArgSchema('heroTag')
  static Map<String, dynamic> _heroTagSchema() => SchemaHelper.stringSchema;

  @JsonArgDecoder('heroTag')
  Object _decodeHeroTag({
    required dynamic value,
  }) =>
      value ?? const _DefaultHeroTag();

  @JsonDefaultParam('heroTag', "'<default FloatingActionButton tag>'")
  @override
  FloatingActionButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _DefaultHeroTag {
  const _DefaultHeroTag();
  @override
  String toString() => '<default FloatingActionButton tag>';
}
