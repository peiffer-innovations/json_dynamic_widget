import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [InteractiveViewer] widget.  See the [fromDynamic] for the
/// format.
class JsonInteractiveViewerBuilder extends JsonWidgetBuilder {
  const JsonInteractiveViewerBuilder({
    this.alignment,
    required this.boundaryMargin,
    required this.clipBehavior,
    required this.constrained,
    required this.interactionEndFrictionCoefficient,
    required this.maxScale,
    required this.minScale,
    this.onInteractionEnd,
    this.onInteractionStart,
    this.onInteractionUpdate,
    required this.panAxis,
    required this.panEnabled,
    required this.scaleEnabled,
    required this.scaleFactor,
    this.transformationController,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'interactive_viewer';

  final Alignment? alignment;
  final EdgeInsets boundaryMargin;
  final Clip clipBehavior;
  final bool constrained;
  final double interactionEndFrictionCoefficient;
  final double maxScale;
  final double minScale;
  final GestureScaleEndCallback? onInteractionEnd;
  final GestureScaleStartCallback? onInteractionStart;
  final GestureScaleUpdateCallback? onInteractionUpdate;
  final PanAxis panAxis;
  final bool panEnabled;
  final bool scaleEnabled;
  final double scaleFactor;
  final TransformationController? transformationController;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "boundaryMargin": "<EdgeInsets>",
  ///   "clipBehavior": "<Clip>",
  ///   "constrained": "<bool>",
  ///   "interactionEndFrictionCoefficient": "<double>",
  ///   "maxScale": "<double>",
  ///   "minScale": "<double>",
  ///   "onInteractionEnd": "<GestureScaleEndCallback>",
  ///   "onInteractionStart": "<GestureScaleStartCallback>",
  ///   "onInteractionUpdate": "<GestureScaleUpdateCallback>",
  ///   "panAxis": "<PanAxis>",
  ///   "panEnabled": "<bool>",
  ///   "scaleEnabled": "<bool>",
  ///   "scaleFactor": "<double>",
  ///   "transformationController": "<TransformationController>"
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
  static JsonInteractiveViewerBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonInteractiveViewerBuilder? result;

    if (map != null) {
      result = JsonInteractiveViewerBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        boundaryMargin: ThemeDecoder.decodeEdgeInsetsGeometry(
              map['boundaryMargin'],
              validate: false,
            ) as EdgeInsets? ??
            EdgeInsets.zero,
        clipBehavior: ThemeDecoder.decodeClip(
              map['clipBehavior'],
              validate: false,
            ) ??
            Clip.hardEdge,
        constrained: map['constrained'] == null
            ? true
            : JsonClass.parseBool(
                map['constrained'],
              ),
        interactionEndFrictionCoefficient: JsonClass.maybeParseDouble(
                map['interactionEndFrictionCoefficient']) ??
            0.0000135,
        maxScale: JsonClass.maybeParseDouble(
          map['maxScale'],
          2.5,
        )!,
        minScale: JsonClass.maybeParseDouble(
          map['minScale'],
          0.8,
        )!,
        onInteractionEnd: map['onInteractionEnd'],
        onInteractionStart: map['onInteractionStart'],
        onInteractionUpdate: map['onInteractionUpdate'],
        panAxis: ThemeDecoder.decodePanAxis(
              map['panAxis'],
              validate: false,
            ) ??
            PanAxis.free,
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
        scaleFactor: JsonClass.maybeParseDouble(map['scaleFactor']) ?? 200.0,
        transformationController: map['transformationController'],
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
    final child = getChild(data);

    return InteractiveViewer(
      alignment: alignment,
      // alignPanAxis: @deprecated,
      boundaryMargin: boundaryMargin,
      clipBehavior: clipBehavior,
      constrained: constrained,
      interactionEndFrictionCoefficient: interactionEndFrictionCoefficient,
      key: key,
      maxScale: maxScale,
      minScale: minScale,
      onInteractionEnd: onInteractionEnd,
      onInteractionStart: onInteractionStart,
      onInteractionUpdate: onInteractionUpdate,
      panAxis: panAxis,
      panEnabled: panEnabled,
      scaleEnabled: scaleEnabled,
      scaleFactor: scaleFactor,
      transformationController: transformationController,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
