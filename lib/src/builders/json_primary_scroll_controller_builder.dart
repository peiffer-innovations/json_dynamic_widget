import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that creates a scroll controller and then creates a
/// [PrimaryScrollController] widget on the tree.
class JsonPrimaryScrollControllerBuilder extends JsonWidgetBuilder {
  JsonPrimaryScrollControllerBuilder({
    this.controller,
    this.debugLabel,
    this.initialScrollOffset,
    required this.keepScrollOffset,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'primary_scroll_controller';

  final ScrollController? controller;
  final String? debugLabel;
  final double? initialScrollOffset;
  final bool keepScrollOffset;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "controller": <ScrollController>,
  ///   "debugLabel": <String>,
  ///   "initialScrollOffset": <double>,
  ///   "keepScrollOffset": <bool>
  /// }
  /// ```
  ///
  /// Where the value of the `key` attribute is the key used on the
  /// [JsonWidgetRegistry.setValue] to store the current [ScrollController].
  static JsonPrimaryScrollControllerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonPrimaryScrollControllerBuilder? result;

    if (map != null) {
      result = JsonPrimaryScrollControllerBuilder(
        debugLabel: map['debugLabel'],
        initialScrollOffset: JsonClass.parseDouble(map['initialScrollOffset']),
        keepScrollOffset: JsonClass.parseBool(
          map['keepScrollOffset'],
          whenNull: true,
        ),
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
    assert(
      data.children?.length == 1 || data.children?.isNotEmpty != true,
      '[JsonPrimaryScrollControllerBuilder] only supports zero or one child.',
    );

    return _JsonPrimaryScrollControllerWidget(
      builder: this,
      childBuilder: childBuilder,
      controller: controller,
      data: data,
      key: key,
    );
  }
}

class _JsonPrimaryScrollControllerWidget extends StatefulWidget {
  _JsonPrimaryScrollControllerWidget({
    required this.builder,
    required this.childBuilder,
    required this.controller,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonPrimaryScrollControllerBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final ScrollController? controller;
  final JsonWidgetData data;

  @override
  _JsonPrimaryScrollControllerWidgetState createState() =>
      _JsonPrimaryScrollControllerWidgetState();
}

class _JsonPrimaryScrollControllerWidgetState
    extends State<_JsonPrimaryScrollControllerWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ??
        ScrollController(
          debugLabel: widget.builder.debugLabel,
          initialScrollOffset: widget.builder.initialScrollOffset ?? 0,
          keepScrollOffset: widget.builder.keepScrollOffset,
        );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PrimaryScrollController(
        controller: _controller,
        child: Builder(
          builder: (BuildContext context) {
            return widget.data.children?.isNotEmpty == true
                ? widget.data.children![0].build(
                    childBuilder: widget.childBuilder,
                    context: context,
                  )
                : SizedBox();
          },
        ),
      );
}
