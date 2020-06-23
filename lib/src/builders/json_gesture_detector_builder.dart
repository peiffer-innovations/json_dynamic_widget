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
    this.dragStartBehavior,
    this.excludeFromSemantics,
    this.onDoubleTap,
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
    this.onSecondaryTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    this.onVerticalDragCancel,
    this.onVerticalDragDown,
    this.onVerticalDragEnd,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
  });

  static const type = 'gesture_detector';

  final HitTestBehavior behavior;
  final DragStartBehavior dragStartBehavior;
  final bool excludeFromSemantics;
  final GestureDoubleTapCallback onDoubleTap;
  final GestureForcePressEndCallback onForcePressEnd;
  final GestureForcePressPeakCallback onForcePressPeak;
  final GestureForcePressStartCallback onForcePressStart;
  final GestureForcePressUpdateCallback onForcePressUpdate;
  final GestureDragCancelCallback onHorizontalDragCancel;
  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragEndCallback onHorizontalDragEnd;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureLongPressCallback onLongPress;
  final GestureLongPressEndCallback onLongPressEnd;
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressUpCallback onLongPressUp;
  final GestureDragCancelCallback onPanCancel;
  final GestureDragDownCallback onPanDown;
  final GestureDragEndCallback onPanEnd;
  final GestureDragStartCallback onPanStart;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureScaleEndCallback onScaleEnd;
  final GestureScaleStartCallback onScaleStart;
  final GestureScaleUpdateCallback onScaleUpdate;
  final GestureTapCancelCallback onSecondaryTapCancel;
  final GestureTapDownCallback onSecondaryTapDown;
  final GestureTapUpCallback onSecondaryTapUp;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;
  final GestureDragCancelCallback onVerticalDragCancel;
  final GestureDragDownCallback onVerticalDragDown;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "behavior": <HitTestBehavior>,
  ///   "dragStartBehavior": <DragStartBehavior>,
  ///   "excludeFromSemantics": <bool>
  ///   "onDoubleTap": <GestureDoubleTapCallback>,
  ///   "onForcePressEnd": <GestureForcePressEndCallback>,
  ///   "onForcePressPeak": <GestureForcePressPeakCallback>,
  ///   "onForcePressStart": <GestureForcePressStartCallback>,
  ///   "onForcePressUpdate": <GestureForcePressUpdateCallback>,
  ///   "onHorizontalDragCancel": <GestureDragCancelCallback>,
  ///   "onHorizontalDragDown": <GestureDragDownCallback>,
  ///   "onHorizontalDragEnd": <GestureDragEndCallback>,
  ///   "onHorizontalDragStart": <GestureDragStartCallback>,
  ///   "onHorizontalDragUpdate": <GestureDragUpdateCallback>
  ///   "onLongPress": <GestureLongPressCallback>,
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
  ///   "onSecondaryTapCancel": <GestureTapCancelCallback>,
  ///   "onSecondaryTapDown": <GestureTapDownCallback>,
  ///   "onSecondaryTapUp": <GestureTapUpCallback>,
  ///   "onTap": <GestureTapCallback>,
  ///   "onTapCancel": <GestureTapCancelCallback>,
  ///   "onTapDown": <GestureTapDownCallback>,
  ///   "onTapUp": <GestureTapUpCallback>,
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
  static JsonGestureDetectorBuilder fromDynamic(dynamic map) {
    JsonGestureDetectorBuilder result;

    if (map != null) {
      result = JsonGestureDetectorBuilder(
        behavior: ThemeDecoder.decodeHitTestBehavior(map['behavior']),
        dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
          map['dragStartBehavior'],
        ),
        excludeFromSemantics: JsonClass.parseBool(map['excludeFromSemantics']),
        onDoubleTap: map['onDoubleTap'],
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
        onSecondaryTapCancel: map['onSecondaryTapChannel'],
        onSecondaryTapDown: map['onSecondartyTapDown'],
        onSecondaryTapUp: map['onSecondaryTapUp'],
        onTap: map['onTap'],
        onTapCancel: map['onTapCancel'],
        onTapDown: map['onTapDown'],
        onTapUp: map['onTapUp'],
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
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonGestureDetectorBuilder] only supports exactly one child.',
    );

    return GestureDetector(
      behavior: behavior,
      dragStartBehavior: dragStartBehavior,
      excludeFromSemantics: excludeFromSemantics,
      onDoubleTap: onDoubleTap,
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
      onSecondaryTapCancel: onSecondaryTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onVerticalDragCancel: onVerticalDragCancel,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
    );
  }
}
