import 'dart:ui';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_scroll_configuration_builder.g.dart';

/// Builder that can build an [ScrollConfiguration] widget.
@jsonWidget
abstract class _JsonScrollConfigurationBuilder extends JsonWidgetBuilder {
  const _JsonScrollConfigurationBuilder({
    required super.args,
  });

  @override
  _ScrollConfiguration buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _ScrollConfiguration extends StatelessWidget {
  const _ScrollConfiguration({
    required this.child,
    this.childBuilder,
    this.dragDevices,
    this.overscroll,
    this.physics,
    this.platform,
    this.scrollbars,
  });

  final JsonWidgetData child;
  final ChildWidgetBuilder? childBuilder;
  final Set<PointerDeviceKind>? dragDevices;
  final bool? overscroll;
  final ScrollPhysics? physics;
  final TargetPlatform? platform;
  final bool? scrollbars;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: dragDevices,
          overscroll: overscroll,
          physics: physics,
          platform: platform,
          scrollbars: scrollbars,
        ),
        key: key,
        child: child.build(
          context: context,
          childBuilder: childBuilder,
        ),
      );
}
