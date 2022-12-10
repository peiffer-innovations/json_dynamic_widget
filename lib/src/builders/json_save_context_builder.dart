import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that sets a the current [BuildContext] on the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.  See the [fromDynamic] for the format.
class JsonSaveContextBuilder extends JsonWidgetBuilder {
  JsonSaveContextBuilder({
    required this.key,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'save_context';

  final String key;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "key": <String>
  /// }
  /// ```
  ///
  /// Where the value of the `key` attribute is the key used on the
  /// [JsonWidgetRegistry.setValue] to store the current [BuildContext].
  static JsonSaveContextBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSaveContextBuilder? result;

    if (map != null) {
      result = JsonSaveContextBuilder(key: map['key'] ?? 'context');
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
      '[JsonSaveContextBuilder] only supports zero or one child.',
    );

    return _JsonSaveContextWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
    );
  }
}

class _JsonSaveContextWidget extends StatefulWidget {
  _JsonSaveContextWidget({
    required this.builder,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonSaveContextBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonSaveContextWidgetState createState() => _JsonSaveContextWidgetState();
}

class _JsonSaveContextWidgetState extends State<_JsonSaveContextWidget> {
  @override
  void dispose() {
    widget.data.registry.removeValue(
      widget.builder.key,
      originator: widget.builder.key,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (BuildContext context) {
          widget.data.registry.setValue(
            widget.builder.key,
            context,
            originator: widget.builder.key,
          );
          return widget.data.children?.isNotEmpty == true
              ? widget.data.children![0].build(
                  childBuilder: widget.childBuilder,
                  context: context,
                )
              : SizedBox();
        },
      );
}
