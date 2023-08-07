import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_hero_builder.g.dart';

/// Builder that can build an [Hero] widget.
@jsonWidget
abstract class _JsonHeroBuilder extends JsonWidgetBuilder {
  const _JsonHeroBuilder({
    required super.numSupportedChildren,
  });

  @override
  Hero buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
