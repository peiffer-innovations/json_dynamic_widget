import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Scrollbar] widget.  See the [fromDynamic] for the
/// format.
class JsonScrollConfigurationBuilder extends JsonWidgetBuilder {
  JsonScrollConfigurationBuilder({
    this.dragDevices,
    this.overscroll,
    this.physics,
    this.platform,
    this.scrollbars,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'scroll_configuration';

  final Set<PointerDeviceKind>? dragDevices;
  final bool? overscroll;
  final ScrollPhysics? physics;
  final TargetPlatform? platform;
  final bool? scrollbars;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "dragDevices": <Set<PointerDeviceKind>>,
  ///   "overscroll": <bool>,
  ///   "physics": <ScrollPhysics>,
  ///   "platform": <TargetPlatform>,
  ///   "scrollbars": <bool>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeScrollPhysics]
  static JsonScrollConfigurationBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonScrollConfigurationBuilder? result;
    if (map != null) {
      result = JsonScrollConfigurationBuilder(
        dragDevices: map['dragDevices'],
        overscroll: map['overscroll'] == null
            ? null
            : JsonClass.parseBool(map['overscroll']),
        physics: ThemeDecoder.decodeScrollPhysics(
          map['physics'],
          validate: false,
        ),
        scrollbars: map['scrollbars'] == null
            ? null
            : JsonClass.parseBool(map['scrollbars']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data).build(
      childBuilder: childBuilder,
      context: context,
    );
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: dragDevices,
        overscroll: overscroll,
        physics: physics,
        platform: platform,
        scrollbars: scrollbars,
      ),
      key: key,
      child: child,
    );
  }
}
