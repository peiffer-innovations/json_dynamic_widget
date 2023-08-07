import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_theme_builder.g.dart';

/// Builder that can build an [Theme] widget.
@jsonWidget
abstract class _JsonThemeBuilder extends JsonWidgetBuilder {
  const _JsonThemeBuilder({
    required super.numSupportedChildren,
  });

  @override
  Theme buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
