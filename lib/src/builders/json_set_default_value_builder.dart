import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that sets a value (or group of values) to the [JsonWidgetRegistry].
/// This doesn't actually have a widget and instead simply returns the child's
/// built widget.  See the [fromDynamic] for the format.
///
/// When used closely to the child the value is being set for, it's recommended
/// to use the static reference to avoid the widget receiving the wrong value
/// during build and rebuild cycles.
class JsonSetDefaultValueBuilder extends JsonWidgetBuilder {
  JsonSetDefaultValueBuilder({
    this.values,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'set_default_value';

  final dynamic values;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "<key>": <dynamic>
  /// }
  /// ```
  ///
  /// Where the `key` is any arbitrary [String].  That `key` will be used as the
  /// `key` on [JsonWidgetRegistry.setValue] and the [dynamic] value will be
  /// used as the `value`.
  static JsonSetDefaultValueBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSetDefaultValueBuilder? result;

    if (map != null) {
      result = JsonSetDefaultValueBuilder(values: map);
      registry ??= JsonWidgetRegistry.instance;
      // result.values?.forEach((key, value) => registry.setValue(key, value));
    }

    return result;
  }

  @override
  void remove(JsonWidgetData data) {
    values?.forEach(
      (key, _) => data.registry.removeValue(
        key,
        originator: null,
      ),
    );

    super.remove(data);
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
      '[JsonSetDefaultValueBuilder] only supports zero or one child.',
    );
    values?.forEach((key, value) {
      if (data.registry.getValue(key) == null) {
        data.registry.setValue(
          key,
          value,
          originator: null,
        );
      }
    });

    var child = data.children?.isNotEmpty == true ? data.children![0] : null;
    child = child?.recreate();

    return child?.build(
          childBuilder: childBuilder,
          context: context,
        ) ??
        SizedBox(key: key);
  }
}
