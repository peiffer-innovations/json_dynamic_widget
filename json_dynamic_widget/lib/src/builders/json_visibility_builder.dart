import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_visibility_builder.g.dart';

/// Builder that can build an [Tooltip] widget.
@jsonWidget
abstract class _JsonVisibilityBuilder extends JsonWidgetBuilder {
  const _JsonVisibilityBuilder({
    required super.args,
  });

  @override
  _Visibility buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Visibility extends StatelessWidget {
  const _Visibility({
    required this.child,
    @JsonBuildArg() this.childBuilder,
    @JsonBuildArg() required this.data,
    super.key,
    this.maintainAnimation = false,
    this.maintainInteractivity = false,
    this.maintainSemantics = false,
    this.maintainSize = false,
    this.maintainState = false,
    this.replacement,
    this.visible = true,
  });

  final bool maintainAnimation;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;
  final JsonWidgetData child;
  final bool maintainInteractivity;
  final bool maintainSemantics;
  final bool maintainSize;
  final bool maintainState;
  final JsonWidgetData? replacement;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainAnimation: maintainAnimation,
      maintainInteractivity: maintainInteractivity,
      maintainSemantics: maintainSemantics,
      maintainSize: maintainSize,
      maintainState: maintainState,
      replacement: replacement?.build(
            context: context,
            childBuilder: childBuilder,
            registry: data.jsonWidgetRegistry,
          ) ??
          const SizedBox.shrink(),
      visible: visible,
      child: child.build(
        context: context,
        childBuilder: childBuilder,
        registry: data.jsonWidgetRegistry,
      ),
    );
  }
}
