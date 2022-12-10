import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that creates a scroll controller and then sets it as a variable
/// using the "key" name.
class JsonSetScrollControllerBuilder extends JsonWidgetBuilder {
  JsonSetScrollControllerBuilder({
    this.debugLabel,
    this.initialScrollOffset,
    required this.keepScrollOffset,
    required this.key,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'set_scroll_controller';

  final String? debugLabel;
  final double? initialScrollOffset;
  final bool keepScrollOffset;
  final String key;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "debugLabel": <String>,
  ///   "initialScrollOffset": <double>,
  ///   "keepScrollOffset": <bool>,
  ///   "key": <String>
  /// }
  /// ```
  ///
  /// Where the value of the `key` attribute is the key used on the
  /// [JsonWidgetRegistry.setValue] to store the current [ScrollController].
  static JsonSetScrollControllerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSetScrollControllerBuilder? result;

    if (map != null) {
      result = JsonSetScrollControllerBuilder(
        debugLabel: map['debugLabel'],
        initialScrollOffset: JsonClass.parseDouble(map['initialScrollOffset']),
        keepScrollOffset: JsonClass.parseBool(
          map['keepScrollOffset'],
          whenNull: true,
        ),
        key: map['key'] ?? 'scrollController',
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
      '[JsonSetScrollControllerBuilder] only supports zero or one child.',
    );

    return _JsonSetScrollControllerWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
    );
  }
}

class _JsonSetScrollControllerWidget extends StatefulWidget {
  _JsonSetScrollControllerWidget({
    required this.builder,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonSetScrollControllerBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonSetScrollControllerWidgetState createState() =>
      _JsonSetScrollControllerWidgetState();
}

class _JsonSetScrollControllerWidgetState
    extends State<_JsonSetScrollControllerWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController(
      debugLabel: widget.builder.debugLabel,
      initialScrollOffset: widget.builder.initialScrollOffset ?? 0,
      keepScrollOffset: widget.builder.keepScrollOffset,
    );

    widget.data.registry.setValue(
      widget.builder.key,
      _controller,
      originator: null,
    );
    widget.data.children?.forEach((e) => e.recreate());
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.data.registry.removeValue(
      widget.builder.key,
      originator: null,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (BuildContext context) {
          return widget.data.children?.isNotEmpty == true
              ? widget.data.children![0].build(
                  childBuilder: widget.childBuilder,
                  context: context,
                )
              : SizedBox();
        },
      );
}
