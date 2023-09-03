import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_linear_progress_indicator_builder.g.dart';

/// Builder that can build an [LinearProgressIndicator] widget.
@jsonWidget
abstract class _JsonLinearProgressIndicatorBuilder extends JsonWidgetBuilder {
  const _JsonLinearProgressIndicatorBuilder({
    required super.args,
  });

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
  LinearProgressIndicator buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
