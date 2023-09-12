import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_animated_switcher_builder.g.dart';

/// Builder that can build an [AnimatedSwitcher] widget.
@jsonWidget
abstract class _JsonAnimatedSwitcherBuilder extends JsonWidgetBuilder {
  const _JsonAnimatedSwitcherBuilder({
    required super.args,
  });

  @JsonArgDecoder('layoutBuilder')
  Widget Function(Widget?, List<Widget>) _decodeLayoutBuilder(
          {required dynamic value}) =>
      value ?? AnimatedSwitcher.defaultLayoutBuilder;

  @JsonArgDecoder('transitionBuilder')
  Widget Function(Widget child, Animation<double> animation)
      _decodeTransitionBuilder({required dynamic value}) =>
          value ?? AnimatedSwitcher.defaultTransitionBuilder;

  @override
  AnimatedSwitcher buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
