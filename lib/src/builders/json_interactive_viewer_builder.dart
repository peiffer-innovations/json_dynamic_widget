import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [InteractiveViewer] widget.  See the [fromDynamic] for the
/// format.
class JsonInteractiveViewerBuilder extends JsonWidgetBuilder {
  JsonInteractiveViewerBuilder({
    this.alignPanAxis,
    this.boundaryMargin,
    this.constrained,
    this.maxScale,
    this.minScale,
    this.onInteractionEnd,
    this.onInteractionStart,
    this.onInteractionUpdate,
    this.panEnabled,
    this.scaleEnabled,
    this.transformationController,
  });

  static const type = 'interactive_viewer';

  final bool alignPanAxis;
  final EdgeInsets boundaryMargin;
  final bool constrained;
  final double maxScale;
  final double minScale;
  final GestureScaleEndCallback onInteractionEnd;
  final GestureScaleStartCallback onInteractionStart;
  final GestureScaleUpdateCallback onInteractionUpdate;
  final bool panEnabled;
  final bool scaleEnabled;
  final TransformationController transformationController;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignPanAxis": <bool>,
  ///   "boundaryMargin": <EdgeInsets>,
  ///   "constrained": <bool>,
  ///   "maxScale": <double>,
  ///   "minScale": <double>,
  ///   "onInteractionEnd": <GestureScaleEndCallback>,
  ///   "onInteractionStart": <GestureScaleStartCallback>,
  ///   "onInteractionUpdate": <GestureScaleUpdateCallback>,
  ///   "panEnabled": <bool>,
  ///   "scaleEnabled": <bool>,
  ///   "transformationController": <TransformationController>
  /// }
  /// ```
  ///
  /// As a note, the [GestureScaleEndCallback], [GestureScaleStartCallback],
  /// [GestureScaleUpdateCallback], and [TransformationController]
  /// cannot be decoded via JSON.  Instead, the only way to bind those values to
  /// the builder is to use a function or a variable reference via the
  /// [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  static JsonInteractiveViewerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonInteractiveViewerBuilder result;

    if (map != null) {
      result = JsonInteractiveViewerBuilder(
        alignPanAxis: map['alignPanAxis'] == null
            ? false
            : JsonClass.parseBool(
                map['alignPanAxis'],
              ),
        boundaryMargin: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['boundaryMargin'],
              validate: false,
            ) ??
            EdgeInsets.zero,
        constrained: map['constrained'] == null
            ? true
            : JsonClass.parseBool(
                map['constrained'],
              ),
        maxScale: JsonClass.parseDouble(
          map['maxScale'],
          2.5,
        ),
        minScale: JsonClass.parseDouble(
          map['minScale'],
          0.8,
        ),
        onInteractionEnd: map['onInteractionEnd'],
        onInteractionStart: map['onInteractionStart'],
        onInteractionUpdate: map['onInteractionUpdate'],
        panEnabled: map['panEnabled'] == null
            ? true
            : JsonClass.parseBool(
                map['panEnabled'],
              ),
        scaleEnabled: map['scaleEnabled'] == null
            ? true
            : JsonClass.parseBool(
                map['scaleEnabled'],
              ),
        transformationController: map['transformationController'],
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
      data.children?.length == 1,
      '[JsonInteractiveViewerBuilder] only supports exactly one child.',
    );

    return InteractiveViewer(
      alignPanAxis: alignPanAxis,
      boundaryMargin: boundaryMargin,
      constrained: constrained,
      maxScale: maxScale,
      minScale: minScale,
      onInteractionEnd: onInteractionEnd,
      onInteractionStart: onInteractionStart,
      onInteractionUpdate: onInteractionUpdate,
      panEnabled: panEnabled,
      scaleEnabled: scaleEnabled,
      transformationController: transformationController,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
