import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.  See the [fromDynamic] for the format.
class JsonSetWidgetBuilder extends JsonWidgetBuilder {
  JsonSetWidgetBuilder({
    this.widgets,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;
  static const type = 'set_widget';

  final Map<String, JsonWidgetData?>? widgets;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "<key>": <JsonWidgetData>
  /// }
  /// ```
  ///
  /// Where the `key` is any arbitrary [String].  That `key` will be used as the
  /// `key` on [JsonWidgetRegistry.setValue] and the [JsonWidgetData] value
  /// will be used as the `value`.
  ///
  /// See also:
  ///  * [JsonWidgetData.fromDynamic]
  static JsonSetWidgetBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSetWidgetBuilder? result;
    var innerRegistry = registry ?? JsonWidgetRegistry.instance;

    if (map != null) {
      var widgets = <String, JsonWidgetData?>{};
      map.forEach(
        (key, value) => widgets[key] = JsonWidgetData.fromDynamic(value),
      );

      result = JsonSetWidgetBuilder(widgets: widgets);
      registry ??= JsonWidgetRegistry.instance;
      result.widgets?.forEach(
        (key, value) => innerRegistry.setValue(
          key,
          value,
          originator: null,
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
      '[JsonSetWidgetBuilder] only supports zero or one child.',
    );

    return data.children?.isNotEmpty == true
        ? data.children![0].build(
            childBuilder: childBuilder,
            context: context,
          )
        : SizedBox(key: key);
  }

  @override
  void remove(JsonWidgetData data) {
    widgets?.forEach(
      (key, _) => data.registry.removeValue(
        key,
        originator: null,
      ),
    );

    super.remove(data);
  }
}
