import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_primary_scroll_controller_builder.g.dart';

/// Builder that can build an [PrimaryScrollController] widget.
@jsonWidget
abstract class _JsonPrimaryScrollControllerBuilder extends JsonWidgetBuilder {
  const _JsonPrimaryScrollControllerBuilder();

  @JsonArgDecoder('automaticallyInheritForPlatforms')
  Set<TargetPlatform> _decodeAutomaticallyInheritForPlatforms({
    required dynamic value,
  }) =>
      value ??
      <TargetPlatform>{
        TargetPlatform.android,
        TargetPlatform.iOS,
        TargetPlatform.fuchsia,
      };

  @override
  _PrimaryScrollController buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _PrimaryScrollController extends StatefulWidget {
  const _PrimaryScrollController({
    required this.automaticallyInheritForPlatforms,
    required this.child,
    @JsonBuildArg() this.childBuilder,
    required this.controller,
    required this.scrollDirection,
  });

/* COPIED FROM [PrimaryScrollController.automaticallyInheritForPlatforms]*/
  /// The [TargetPlatform]s this controller is configured for [ScrollView]s to
  /// automatically inherit.
  ///
  /// Used in conjunction with [scrollDirection]. If the [Axis] provided to
  /// [shouldInherit] is not [scrollDirection], this is ignored.
  ///
  /// When empty, no ScrollView in any Axis will automatically inherit this
  /// controller. Defaults to [TargetPlatformVariant.mobile].
  final dynamic automaticallyInheritForPlatforms;

  final JsonWidgetData child;
  final ChildWidgetBuilder? childBuilder;

/* COPIED FROM [PrimaryScrollController.controller]*/
  /// The [ScrollController] associated with the subtree.
  ///
  /// See also:
  ///
  ///  * [ScrollView.controller], which discusses the purpose of specifying a
  ///    scroll controller.
  final ScrollController? controller;

/* COPIED FROM [PrimaryScrollController.scrollDirection]*/
  /// The [Axis] this controller is configured for [ScrollView]s to
  /// automatically inherit.
  ///
  /// Used in conjunction with [automaticallyInheritForPlatforms]. If the
  /// current [TargetPlatform] is not included in
  /// [automaticallyInheritForPlatforms], this is ignored.
  ///
  /// When null, no [ScrollView] in any Axis will automatically inherit this
  /// controller. This is dissimilar to [PrimaryScrollController.none]. When a
  /// PrimaryScrollController is inherited, ScrollView will insert
  /// PrimaryScrollController.none into the tree to prevent further descendant
  /// ScrollViews from inheriting the current PrimaryScrollController.
  ///
  /// For the direction in which active scrolling may be occurring, see
  /// [ScrollDirection].
  ///
  /// Defaults to [Axis.vertical].
  final Axis? scrollDirection;

  @override
  State createState() => _PrimaryScrollControllerState();
}

class _PrimaryScrollControllerState extends State<_PrimaryScrollController> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      automaticallyInheritForPlatforms: widget.automaticallyInheritForPlatforms,
      controller: _controller,
      scrollDirection: widget.scrollDirection,
      child: widget.child.build(
        context: context,
        childBuilder: widget.childBuilder,
      ),
    );
  }
}
