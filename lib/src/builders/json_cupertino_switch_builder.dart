import 'package:child_builder/child_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [CupertinoSwitch] widget.  See the [fromDynamic]
/// for the format.
class JsonCupertinoSwitchBuilder extends JsonWidgetBuilder {
  JsonCupertinoSwitchBuilder({
    this.activeColor,
    this.dragStartBehavior,
    this.onChanged,
    this.trackColor,
    this.value,
    this.visualDensity,
  });

  static const type = 'cupertino_switch';

  final Color activeColor;
  final DragStartBehavior dragStartBehavior;
  final ValueChanged<bool> onChanged;
  final Color trackColor;
  final dynamic value;
  final VisualDensity visualDensity;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "activeColor": <Color>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "onChanged": <ValueCallback<bool>>,
  ///   "trackColor": <Color>,
  ///   "value": <bool>,
  ///   "visualDensity": <VisualDensity>,
  /// }
  ///
  /// As a note, the [ValueCallback<bool>] cannot be decoded via JSON.  Instead,
  /// the only way to bind those values to the builder is to use a function or a
  /// variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeVisualDensity]
  /// ```
  static JsonCupertinoSwitchBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonCupertinoSwitchBuilder result;

    if (map != null) {
      result = JsonCupertinoSwitchBuilder(
        activeColor: ThemeDecoder.decodeColor(map['activeColor']),
        dragStartBehavior:
            ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior']),
        onChanged: map['onChanged'],
        value: map['value'] == null ? null : JsonClass.parseBool(map['value']),
        visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty == true,
      '[JsonCupertinoSwitchBuilder] does not support children.',
    );

    return CupertinoSwitch(
      activeColor: activeColor,
      dragStartBehavior: dragStartBehavior,
      onChanged: onChanged,
      trackColor: trackColor,
      value: value,
    );
  }
}
