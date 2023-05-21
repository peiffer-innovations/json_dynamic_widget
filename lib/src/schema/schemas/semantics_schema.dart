import 'package:json_theme/json_theme_schemas.dart';

class SemanticsSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/semantics.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': 1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Semantics-class.html',
    'type': 'object',
    'title': 'Semantics',
    'additionalProperties': false,
    'properties': {
      SemanticsSchemaProperty.attributedDecreasedValue: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.attributedHint: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.attributedIncreasedValue: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.attributedLabel: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.attributedValue: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.button: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.customSemanticsActions: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.checked: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.container: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.currentValueLength: SchemaHelper.numberSchema,
      SemanticsSchemaProperty.decreasedValue: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.enabled: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.excludeSemantics: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.explicitChildNodes: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.focusable: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.focused: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.header: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.hidden: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.hint: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.image: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.inMutuallyExclusiveGroup: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.increasedValue: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.keyboardKey: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.label: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.link: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.liveRegion: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.maxValueLength: SchemaHelper.numberSchema,
      SemanticsSchemaProperty.mixed: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.multiline: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.namesRoute: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.obscured: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.onCopy: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onCut: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onDecrease: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onDidGainAccessibilityFocus: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onDidLoseAccessibilityFocus: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onDismiss: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onIncrease: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onLongPress: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onLongPressHint: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onMoveCursorBackwardByCharacter: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onMoveCursorForwardByCharacter: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onPaste: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onScrollDown: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onScrollLeft: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onScrollRight: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onScrollUp: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onSetSelection: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onSetText: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onTap: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.onTapHint: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.readOnly: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.scopesRoute: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.selected: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.slider: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.sortKey: SchemaHelper.objectSchema(OrdinalSortKeySchema.id),
      SemanticsSchemaProperty.tagForChildren: SchemaHelper.objectSchema(SemanticsTagSchema.id),
      SemanticsSchemaProperty.textDirection: SchemaHelper.objectSchema(TextDirectionSchema.id),
      SemanticsSchemaProperty.textField: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.tooltip: SchemaHelper.stringSchema,
      SemanticsSchemaProperty.toggled: SchemaHelper.boolSchema,
      SemanticsSchemaProperty.value: SchemaHelper.stringSchema,
    }
  };
}

class SemanticsSchemaProperty {
  static const attributedDecreasedValue = 'attributedDecreasedValue';
  static const attributedHint = 'attributedHint';
  static const attributedIncreasedValue = 'attributedIncreasedValue';
  static const attributedLabel = 'attributedLabel';
  static const attributedValue = 'attributedValue';
  static const button = 'button';
  static const customSemanticsActions = 'customSemanticsActions';
  static const checked = 'checked';
  static const container = 'container';
  static const currentValueLength = 'currentValueLength';
  static const decreasedValue = 'decreasedValue';
  static const enabled = 'enabled';
  static const excludeSemantics = 'excludeSemantics';
  static const explicitChildNodes = 'explicitChildNodes';
  static const focusable = 'focusable';
  static const focused = 'focused';
  static const header = 'header';
  static const hidden = 'hidden';
  static const hint = 'hint';
  static const image = 'image';
  static const inMutuallyExclusiveGroup = 'inMutuallyExclusiveGroup';
  static const increasedValue = 'increasedValue';
  static const keyboardKey = 'keyboardKey';
  static const label = 'label';
  static const link = 'link';
  static const liveRegion = 'liveRegion';
  static const maxValueLength = 'maxValueLength';
  static const mixed = 'mixed';
  static const multiline = 'multiline';
  static const namesRoute = 'namesRoute';
  static const obscured = 'obscured';
  static const onCopy = 'onCopy';
  static const onCut = 'onCut';
  static const onDecrease = 'onDecrease';
  static const onDidGainAccessibilityFocus = 'onDidGainAccessibilityFocus';
  static const onDidLoseAccessibilityFocus = 'onDidLoseAccessibilityFocus';
  static const onDismiss = 'onDismiss';
  static const onIncrease = 'onIncrease';
  static const onLongPress = 'onLongPress';
  static const onLongPressHint = 'onLongPressHint';
  static const onMoveCursorBackwardByCharacter = 'onMoveCursorBackwardByCharacter';
  static const onMoveCursorForwardByCharacter = 'onMoveCursorForwardByCharacter';
  static const onPaste = 'onPaste';
  static const onScrollDown = 'onScrollDown';
  static const onScrollLeft = 'onScrollLeft';
  static const onScrollRight = 'onScrollRight';
  static const onScrollUp = 'onScrollUp';
  static const onSetSelection = 'onSetSelection';
  static const onSetText = 'onSetText';
  static const onTap = 'onTap';
  static const onTapHint = 'onTapHint';
  static const readOnly = 'readOnly';
  static const scopesRoute = 'scopesRoute';
  static const selected = 'selected';
  static const slider = 'slider';
  static const sortKey = 'sortKey';
  static const tagForChildren = 'tagForChildren';
  static const textDirection = 'textDirection';
  static const textField = 'textField';
  static const tooltip = 'tooltip';
  static const toggled = 'toggled';
  static const value = 'value';
}
