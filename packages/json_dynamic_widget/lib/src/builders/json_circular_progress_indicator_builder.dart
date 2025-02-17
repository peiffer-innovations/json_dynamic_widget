import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_circular_progress_indicator_builder.g.dart';

/// Builder that can build a [CircularProgressIndicator] widget.
@jsonWidget
abstract class _JsonCircularProgressIndicatorBuilder extends JsonWidgetBuilder {
  const _JsonCircularProgressIndicatorBuilder({required super.args});

  @JsonArgDecoder('strokeAlign')
  double _decodeStrokeAlign({required dynamic value}) =>
      JsonClass.maybeParseDouble(value) ??
      CircularProgressIndicator.strokeAlignCenter;

  @JsonArgDecoder('valueColor')
  Animation<Color>? _decodeValueColor({required dynamic value}) =>
      value == null
          ? null
          : value is Animation<Color>
          ? value
          : AlwaysStoppedAnimation(
            ThemeDecoder.decodeColor(value, validate: false)!,
          );

  @JsonDefaultParam(
    'strokeAlign',
    'CircularProgressIndicator.strokeAlignCenter',
  )
  @JsonDefaultParam('valueColor', 'null')
  @override
  CircularProgressIndicator buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
