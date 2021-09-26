import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [GestureDetector] widget.  See the [fromDynamic]
/// for the format.
class JsonGestureDetectorBuilder extends JsonWidgetBuilder {
  JsonGestureDetectorBuilder({
    this.behavior,
    required this.dragStartBehavior,
    required this.excludeFromSemantics,
    this.onDoubleTap,
    this.onDoubleTapCancel,
    this.onDoubleTapDown,
    this.onForcePressEnd,
    this.onForcePressPeak,
    this.onForcePressStart,
    this.onForcePressUpdate,
    this.onHorizontalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragEnd,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onLongPress,
    this.onLongPressCancel,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onLongPressMoveUpdate,
    this.onLongPressStart,
    this.onLongPressUp,
    this.onPanCancel,
    this.onPanDown,
    this.onPanEnd,
    this.onPanStart,
    this.onPanUpdate,
    this.onScaleEnd,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressEnd,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressUp,
    this.onSecondaryTap,
    this.onSecondaryTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressEnd,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressUp,
    this.onTertiaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onVerticalDragCancel,
    this.onVerticalDragDown,
    this.onVerticalDragEnd,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'gesture_detector';

  final HitTestBehavior? behavior;
  final DragStartBehavior dragStartBehavior;
  final bool excludeFromSemantics;
  final GestureDoubleTapCallback? onDoubleTap;
  final GestureTapCancelCallback? onDoubleTapCancel;
  final GestureTapDownCallback? onDoubleTapDown;
  final GestureForcePressEndCallback? onForcePressEnd;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureDragCancelCallback? onHorizontalDragCancel;
  final GestureDragDownCallback? onHorizontalDragDown;
  final GestureDragEndCallback? onHorizontalDragEnd;
  final GestureDragStartCallback? onHorizontalDragStart;
  final GestureDragUpdateCallback? onHorizontalDragUpdate;
  final GestureLongPressCallback? onLongPress;
  final GestureLongPressCancelCallback? onLongPressCancel;
  final GestureLongPressDownCallback? onLongPressDown;
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureDragCancelCallback? onPanCancel;
  final GestureDragDownCallback? onPanDown;
  final GestureDragEndCallback? onPanEnd;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureScaleEndCallback? onScaleEnd;
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleUpdateCallback? onScaleUpdate;
  final GestureLongPressCallback? onSecondaryLongPress;
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;
  final GestureLongPressDownCallback? onSecondaryLongPressDown;
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  final GestureLongPressStartCallback? onSecondaryLongPressStart;
  final GestureLongPressUpCallback? onSecondaryLongPressUp;
  final GestureTapCallback? onSecondaryTap;
  final GestureTapCancelCallback? onSecondaryTapCancel;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureLongPressCallback? onTertiaryLongPress;
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;
  final GestureLongPressDownCallback? onTertiaryLongPressDown;
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;
  final GestureLongPressStartCallback? onTertiaryLongPressStart;
  final GestureLongPressUpCallback? onTertiaryLongPressUp;
  final GestureTapCancelCallback? onTertiaryTapCancel;
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapUpCallback? onTertiaryTapUp;
  final GestureDragCancelCallback? onVerticalDragCancel;
  final GestureDragDownCallback? onVerticalDragDown;
  final GestureDragEndCallback? onVerticalDragEnd;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "behavior": <HitTestBehavior>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "excludeFromSemantics": <bool>
  ///   "onDoubleTap": <GestureDoubleTapCallback>,
  ///   "onDoubleTapCancel": <GestureTapCancelCallback>,
  ///   "onDoubleTapDown": <GestureTapDownCallback>,
  ///   "onForcePressEnd": <GestureForcePressEndCallback>,
  ///   "onForcePressPeak": <GestureForcePressPeakCallback>,
  ///   "onForcePressStart": <GestureForcePressStartCallback>,
  ///   "onForcePressUpdate": <GestureForcePressUpdateCallback>,
  ///   "onHorizontalDragCancel": <GestureDragCancelCallback>,
  ///   "onHorizontalDragDown": <GestureDragDownCallback>,
  ///   "onHorizontalDragEnd": <GestureDragEndCallback>,
  ///   "onHorizontalDragStart": <GestureDragStartCallback>,
  ///   "onHorizontalDragUpdate": <GestureDragUpdateCallback>,
  ///   "onLongPress": <GestureLongPressCallback>,
  ///   "onLongPressCancel": <GestureLongPressCancelCallback>,
  ///   "onLongPressDown": <GestureLongPressDownCallback>,
  ///   "onLongPressEnd": <GestureLongPressEndCallback>,
  ///   "onLongPressMoveUpdate": <GestureLongPressMoveUpdateCallback>,
  ///   "onLongPressStart": <GestureLongPressStartCallback>,
  ///   "onLongPressUp": <GestureLongPressUpCallback>,
  ///   "onPanCancel": <GestureDragCancelCallback>,
  ///   "onPanDown": <GestureDragDownCallback>,
  ///   "onPanEnd": <GestureDragEndCallback>,
  ///   "onPanStart": <GestureDragStartCallback>,
  ///   "onPanUpdate": <GestureDragUpdateCallback>,
  ///   "onScaleEnd": <GestureScaleEndCallback>,
  ///   "onScaleStart": <GestureScaleStartCallback>,
  ///   "onScaleUpdate": <GestureScaleUpdateCallback>,
  ///   "onSecondaryLongPress": <GestureLongPressCallback>,
  ///   "onSecondaryLongPressCancel": <GestureLongPressCancelCallback>,
  ///   "onSecondaryLongPressDown": <GestureLongPressDownCallback>,
  ///   "onSecondaryLongPressEnd": <GestureLongPressEndCallback>,
  ///   "onSecondaryLongPressMoveUpdate": <GestureLongPressMoveUpdateCallback>,
  ///   "onSecondaryLongPressStart": <GestureLongPressStartCallback>,
  ///   "onSecondaryLongPressUp": <GestureLongPressUpCallback>,
  ///   "onSecondaryTap": <GestureTapCallback>,
  ///   "onSecondaryTapCancel": <GestureTapCancelCallback>,
  ///   "onSecondaryTapDown": <GestureTapDownCallback>,
  ///   "onSecondaryTapUp": <GestureTapUpCallback>,
  ///   "onTap": <GestureTapCallback>,
  ///   "onTapCancel": <GestureTapCancelCallback>,
  ///   "onTapDown": <GestureTapDownCallback>,
  ///   "onTapUp": <GestureTapUpCallback>,
  ///   "onTertiaryLongPress": <GestureLongPressCallback>,
  ///   "onTertiaryLongPressCancel": <GestureLongPressCancelCallback>,
  ///   "onTertiaryLongPressDown": <GestureLongPressDownCallback>,
  ///   "onTertiaryLongPressEnd": <GestureLongPressEndCallback>,
  ///   "onTertiaryLongPressMoveUpdate": <GestureLongPressMoveUpdateCallback>,
  ///   "onTertiaryLongPressStart": <GestureLongPressStartCallback>,
  ///   "onTertiaryLongPressUp": <GestureLongPressUpCallback>,
  ///   "onTertiaryTapCancel": <GestureTapCancelCallback>,
  ///   "onTertiaryTapDown": <GestureTapDownCallback>,
  ///   "onTertiaryTapUp": <GestureTapUpCallback>,
  ///   "onVerticalDragCancel": <GestureDragCancelCallback>,
  ///   "onVerticalDragDown": <GestureDragDownCallback>,
  ///   "onVerticalDragEnd": <GestureDragEndCallback>,
  ///   "onVerticalDragStart": <GestureDragStartCallback>,
  ///   "onVerticalDragUpdate": <GestureDragUpdateCallback>
  /// }
  /// ```
  ///
  /// As a note, none of the `Gesture*Callback` classes can be decoded via JSON.
  /// Instead, the only way to bind those values to the  builder is to use a
  /// function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeDragStartBehavior]
  ///  * [ThemeDecoder.decodeHitTestBehavior]
  static JsonGestureDetectorBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonGestureDetectorBuilder? result;

    if (map != null) {
      result = JsonGestureDetectorBuilder(
        behavior: ThemeDecoder.decodeHitTestBehavior(
          map['behavior'],
          validate: false,
        ),
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
              map['dragStartBehavior'],
              validate: false,
            ) ??
            DragStartBehavior.start,
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
        onDoubleTap: map['onDoubleTap'],
        onDoubleTapCancel: map['onDoubleTapCancel'],
        onDoubleTapDown: map['onDoubleTapDown'],
        onForcePressEnd: map['onForcePressEnd'],
        onForcePressPeak: map['onForcePressPeak'],
        onForcePressStart: map['onForcePressStart'],
        onForcePressUpdate: map['onForcePressUpdate'],
        onHorizontalDragCancel: map['onHorizontalDragCancel'],
        onHorizontalDragDown: map['onHorizontalDragDown'],
        onHorizontalDragEnd: map['onHorizontalDragEnd'],
        onHorizontalDragStart: map['onHorizontalDragStart'],
        onHorizontalDragUpdate: map['onHorizontalDragUpdate'],
        onLongPress: map['onLongPress'],
        onLongPressCancel: map['onLongPressCancel'],
        onLongPressDown: map['onLongPressDown'],
        onLongPressEnd: map['onLongPressEnd'],
        onLongPressMoveUpdate: map['onLongPressMoveUpdate'],
        onLongPressStart: map['onLongPressStart'],
        onLongPressUp: map['onLongPressUp'],
        onPanCancel: map['onPanCancel'],
        onPanDown: map['onPanDown'],
        onPanEnd: map['onPanEnd'],
        onPanStart: map['onPanStart'],
        onPanUpdate: map['onPanUpdate'],
        onScaleEnd: map['onScaleEnd'],
        onScaleStart: map['onScaleStart'],
        onScaleUpdate: map['onScaleUpdate'],
        onSecondaryLongPress: map['onSecondaryLongPress'],
        onSecondaryLongPressCancel: map['onSecondaryLongPressCancel'],
        onSecondaryLongPressDown: map['onSecondaryLongPressDown'],
        onSecondaryLongPressEnd: map['onSecondaryLongPressEnd'],
        onSecondaryLongPressMoveUpdate: map['onSecondaryLongPressMoveUpdate'],
        onSecondaryLongPressStart: map['onSecondaryLongPressStart'],
        onSecondaryLongPressUp: map['onSecondaryLongPressUp'],
        onSecondaryTap: map['onSecondaryTap'],
        onSecondaryTapCancel: map['onSecondaryTapChannel'],
        onSecondaryTapDown: map['onSecondartyTapDown'],
        onSecondaryTapUp: map['onSecondaryTapUp'],
        onTap: map['onTap'],
        onTapCancel: map['onTapCancel'],
        onTapDown: map['onTapDown'],
        onTapUp: map['onTapUp'],
        onTertiaryLongPress: map['onTertiaryLongPress'],
        onTertiaryLongPressCancel: map['onTertiaryLongPressCancel'],
        onTertiaryLongPressDown: map['onTertiaryLongPressDown'],
        onTertiaryLongPressEnd: map['onTertiaryLongPressEnd'],
        onTertiaryLongPressMoveUpdate: map['onTertiaryLongPressMoveUpdate'],
        onTertiaryLongPressStart: map['onTertiaryLongPressStart'],
        onTertiaryLongPressUp: map['onTertiaryLongPressUp'],
        onTertiaryTapCancel: map['onTertiaryTapCancel'],
        onTertiaryTapDown: map['onTertiaryTapDown'],
        onTertiaryTapUp: map['onTertiaryTapUp'],
        onVerticalDragCancel: map['onVerticalDragCancel'],
        onVerticalDragDown: map['onVerticalDragDown'],
        onVerticalDragEnd: map['onVerticalDragEnd'],
        onVerticalDragStart: map['onVerticalDragStart'],
        onVerticalDragUpdate: map['onVerticalDragUpdate'],
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
    var child = getChild(data);

    return GestureDetector(
      behavior: behavior,
      dragStartBehavior: dragStartBehavior,
      excludeFromSemantics: excludeFromSemantics,
      key: key,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onForcePressEnd: onForcePressEnd,
      onForcePressPeak: onForcePressPeak,
      onForcePressStart: onForcePressStart,
      onForcePressUpdate: onForcePressUpdate,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onLongPress: onLongPress,
      onLongPressCancel: onLongPressCancel,
      onLongPressDown: onLongPressDown,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressStart: onLongPressStart,
      onLongPressUp: onLongPressUp,
      onPanCancel: onPanCancel,
      onPanDown: onPanDown,
      onPanEnd: onPanEnd,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onScaleEnd: onScaleEnd,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressCancel: onSecondaryLongPressCancel,
      onSecondaryLongPressDown: onSecondaryLongPressDown,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTertiaryLongPress: onTertiaryLongPress,
      onTertiaryLongPressCancel: onTertiaryLongPressCancel,
      onTertiaryLongPressDown: onTertiaryLongPressDown,
      onTertiaryLongPressEnd: onTertiaryLongPressEnd,
      onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
      onTertiaryLongPressStart: onTertiaryLongPressStart,
      onTertiaryLongPressUp: onTertiaryLongPressUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onVerticalDragCancel: onVerticalDragCancel,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
