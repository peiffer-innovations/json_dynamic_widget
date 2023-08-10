import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_circular_progress_indicator_builder.g.dart';

/// Builder that can build a [CircularProgressIndicator] widget.
@jsonWidget
abstract class _JsonCircularProgressIndicatorBuilder extends JsonWidgetBuilder {
  const _JsonCircularProgressIndicatorBuilder();

  @JsonArgDecoder('valueColor')
  Animation<Color>? _decodeValueColor({
    required dynamic value,
  }) =>
      value == null
          ? null
          : value is Animation<Color>
              ? value
              : AlwaysStoppedAnimation(
                  ThemeDecoder.decodeColor(
                    value,
                    validate: false,
                  )!,
                );

  @override
  CircularProgressIndicator buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
