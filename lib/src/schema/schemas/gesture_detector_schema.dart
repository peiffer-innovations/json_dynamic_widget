import 'package:json_theme/json_theme_schemas.dart';

class GestureDetectorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/gesture_detector.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/GestureDetector-class.html',
    'type': 'object',
    'title': 'GestureDetector',
    'additionalProperties': false,
    'properties': {
      GestureDetectorSchemaProperty.behavior: SchemaHelper.objectSchema(HitTestBehaviorSchema.id),
      GestureDetectorSchemaProperty.dragStartBehavior:
          SchemaHelper.objectSchema(DragStartBehaviorSchema.id),
      GestureDetectorSchemaProperty.excludeFromSemantics: SchemaHelper.boolSchema,
      GestureDetectorSchemaProperty.onDoubleTap: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onDoubleTapCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onDoubleTapDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onForcePressEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onForcePressPeak: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onForcePressStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onForcePressUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onHorizontalDragCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onHorizontalDragDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onHorizontalDragEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onHorizontalDragStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onHorizontalDragUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressMoveUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onLongPressUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onPanCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onPanDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onPanEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onPanStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onPanUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onScaleEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onScaleStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onScaleUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPress: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressMoveUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryLongPressUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryTap: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryTapCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryTapDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onSecondaryTapUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTap: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTapCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTapDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTapUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPress: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressMoveUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryLongPressUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryTapCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryTapDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onTertiaryTapUp: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onVerticalDragCancel: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onVerticalDragDown: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onVerticalDragEnd: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onVerticalDragStart: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.onVerticalDragUpdate: SchemaHelper.stringSchema,
      GestureDetectorSchemaProperty.supportedDevices:
          SchemaHelper.arraySchema(PointerDeviceKindSchema.id),
    },
  };
}

class GestureDetectorSchemaProperty {
  static const behavior = 'behavior';
  static const dragStartBehavior = 'dragStartBehavior';
  static const excludeFromSemantics = 'excludeFromSemantics';
  static const onDoubleTap = 'onDoubleTap';
  static const onDoubleTapCancel = 'onDoubleTapCancel';
  static const onDoubleTapDown = 'onDoubleTapDown';
  static const onForcePressEnd = 'onForcePressEnd';
  static const onForcePressPeak = 'onForcePressPeak';
  static const onForcePressStart = 'onForcePressStart';
  static const onForcePressUpdate = 'onForcePressUpdate';
  static const onHorizontalDragCancel = 'onHorizontalDragCancel';
  static const onHorizontalDragDown = 'onHorizontalDragDown';
  static const onHorizontalDragEnd = 'onHorizontalDragEnd';
  static const onHorizontalDragStart = 'onHorizontalDragStart';
  static const onHorizontalDragUpdate = 'onHorizontalDragUpdate';
  static const onLongPress = 'onLongPress';
  static const onLongPressCancel = 'onLongPressCancel';
  static const onLongPressDown = 'onLongPressDown';
  static const onLongPressEnd = 'onLongPressEnd';
  static const onLongPressMoveUpdate = 'onLongPressMoveUpdate';
  static const onLongPressStart = 'onLongPressStart';
  static const onLongPressUp = 'onLongPressUp';
  static const onPanCancel = 'onPanCancel';
  static const onPanDown = 'onPanDown';
  static const onPanEnd = 'onPanEnd';
  static const onPanStart = 'onPanStart';
  static const onPanUpdate = 'onPanUpdate';
  static const onScaleEnd = 'onScaleEnd';
  static const onScaleStart = 'onScaleStart';
  static const onScaleUpdate = 'onScaleUpdate';
  static const onSecondaryLongPress = 'onSecondaryLongPress';
  static const onSecondaryLongPressCancel = 'onSecondaryLongPressCancel';
  static const onSecondaryLongPressDown = 'onSecondaryLongPressDown';
  static const onSecondaryLongPressEnd = 'onSecondaryLongPressEnd';
  static const onSecondaryLongPressMoveUpdate = 'onSecondaryLongPressMoveUpdate';
  static const onSecondaryLongPressStart = 'onSecondaryLongPressStart';
  static const onSecondaryLongPressUp = 'onSecondaryLongPressUp';
  static const onSecondaryTap = 'onSecondaryTap';
  static const onSecondaryTapCancel = 'onSecondaryTapCancel';
  static const onSecondaryTapDown = 'onSecondaryTapDown';
  static const onSecondaryTapUp = 'onSecondaryTapUp';
  static const onTap = 'onTap';
  static const onTapCancel = 'onTapCancel';
  static const onTapDown = 'onTapDown';
  static const onTapUp = 'onTapUp';
  static const onTertiaryLongPress = 'onTertiaryLongPress';
  static const onTertiaryLongPressCancel = 'onTertiaryLongPressCancel';
  static const onTertiaryLongPressDown = 'onTertiaryLongPressDown';
  static const onTertiaryLongPressEnd = 'onTertiaryLongPressEnd';
  static const onTertiaryLongPressMoveUpdate = 'onTertiaryLongPressMoveUpdate';
  static const onTertiaryLongPressStart = 'onTertiaryLongPressStart';
  static const onTertiaryLongPressUp = 'onTertiaryLongPressUp';
  static const onTertiaryTapCancel = 'onTertiaryTapCancel';
  static const onTertiaryTapDown = 'onTertiaryTapDown';
  static const onTertiaryTapUp = 'onTertiaryTapUp';
  static const onVerticalDragCancel = 'onVerticalDragCancel';
  static const onVerticalDragDown = 'onVerticalDragDown';
  static const onVerticalDragEnd = 'onVerticalDragEnd';
  static const onVerticalDragStart = 'onVerticalDragStart';
  static const onVerticalDragUpdate = 'onVerticalDragUpdate';
  static const supportedDevices = 'supportedDevices';
}
