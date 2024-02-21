import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_container_builder.g.dart';

/// Builder that can build an [AnimatedContainer] widget.
/// See the [fromDynamic] for the format.
@jsonWidget
abstract class _JsonAnimatedContainerBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedContainerBuilder({
    required super.args,
  });
  @JsonArgSchema('decoration')
  static Map<String, dynamic> _decorationSchema() => BoxDecorationSchema.schema;

  @JsonArgSchema('foregroundDecoration')
  static Map<String, dynamic> _foregroundDecorationSchema() =>
      BoxDecorationSchema.schema;

  @JsonArgEncoder('decoration')
  static Map<String, dynamic>? _encodeDecoration(dynamic value) =>
      value is BoxDecoration ? ThemeEncoder.encodeBoxDecoration(value) : null;

  @JsonArgEncoder('foregroundDecoration')
  static Map<String, dynamic>? _encodeForegroundDecoration(dynamic value) =>
      value is BoxDecoration ? ThemeEncoder.encodeBoxDecoration(value) : null;

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
  AnimatedContainer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
