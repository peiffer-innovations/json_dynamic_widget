import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_switcher_builder.g.dart';

/// Builder that can build an [AnimatedSwitcher] widget.
@jsonWidget
abstract class _JsonAnimatedSwitcherBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedSwitcherBuilder({
    required super.numSupportedChildren,
  });

  @override
  AnimatedSwitcher buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
