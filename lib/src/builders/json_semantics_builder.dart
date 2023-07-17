import 'package:flutter/semantics.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Semantics] widget.  See the [fromDynamic] for the
/// format.
class JsonSemanticsBuilder extends JsonWidgetBuilder {
  const JsonSemanticsBuilder({
    this.attributedDecreasedValue,
    this.attributedHint,
    this.attributedIncreasedValue,
    this.attributedLabel,
    this.attributedValue,
    this.button,
    this.checked,
    this.customSemanticsActions,
    this.container = false,
    this.currentValueLength,
    this.decreasedValue,
    this.enabled,
    this.excludeSemantics = false,
    this.explicitChildNodes = false,
    this.focusable,
    this.focused,
    this.header,
    this.hidden,
    this.hint,
    this.image,
    this.inMutuallyExclusiveGroup,
    this.increasedValue,
    this.keyboardKey,
    this.label,
    this.link,
    this.liveRegion,
    this.maxValueLength,
    this.mixed,
    this.multiline,
    this.namesRoute,
    this.obscured,
    this.onCopy,
    this.onCut,
    this.onDecrease,
    this.onDidGainAccessibilityFocus,
    this.onDidLoseAccessibilityFocus,
    this.onDismiss,
    this.onIncrease,
    this.onLongPress,
    this.onLongPressHint,
    this.onMoveCursorBackwardByCharacter,
    this.onMoveCursorForwardByCharacter,
    this.onPaste,
    this.onScrollDown,
    this.onScrollLeft,
    this.onScrollRight,
    this.onScrollUp,
    this.onSetSelection,
    this.onSetText,
    this.onTap,
    this.onTapHint,
    this.readOnly,
    this.scopesRoute,
    this.selected,
    this.slider,
    this.sortKey,
    this.tagForChildren,
    this.textDirection,
    this.textField,
    this.toggled,
    this.tooltip,
    this.value,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'semantics';

  final AttributedString? attributedDecreasedValue;
  final AttributedString? attributedHint;
  final AttributedString? attributedIncreasedValue;
  final AttributedString? attributedLabel;
  final AttributedString? attributedValue;
  final bool? button;
  final Map<CustomSemanticsAction, VoidCallback>? customSemanticsActions;
  final bool? checked;
  final bool container;
  final int? currentValueLength;
  final String? decreasedValue;
  final bool? enabled;
  final bool excludeSemantics;
  final bool explicitChildNodes;
  final bool? focusable;
  final bool? focused;
  final bool? header;
  final bool? hidden;
  final String? hint;
  final bool? image;
  final bool? inMutuallyExclusiveGroup;
  final String? increasedValue;
  final bool? keyboardKey;
  final String? label;
  final bool? link;
  final bool? liveRegion;
  final int? maxValueLength;
  final bool? mixed;
  final bool? multiline;
  final bool? namesRoute;
  final bool? obscured;
  final VoidCallback? onCopy;
  final VoidCallback? onCut;
  final VoidCallback? onDecrease;
  final VoidCallback? onDidGainAccessibilityFocus;
  final VoidCallback? onDidLoseAccessibilityFocus;
  final VoidCallback? onDismiss;
  final VoidCallback? onIncrease;
  final VoidCallback? onLongPress;
  final String? onLongPressHint;
  final ValueChanged<bool>? onMoveCursorBackwardByCharacter;
  final ValueChanged<bool>? onMoveCursorForwardByCharacter;
  final VoidCallback? onPaste;
  final VoidCallback? onScrollDown;
  final VoidCallback? onScrollLeft;
  final VoidCallback? onScrollRight;
  final VoidCallback? onScrollUp;
  final ValueChanged<TextSelection>? onSetSelection;
  final ValueChanged<String>? onSetText;
  final VoidCallback? onTap;
  final String? onTapHint;
  final bool? readOnly;
  final bool? scopesRoute;
  final bool? selected;
  final bool? slider;
  final SemanticsSortKey? sortKey;
  final SemanticsTag? tagForChildren;
  final TextDirection? textDirection;
  final bool? textField;
  final bool? toggled;
  final String? tooltip;
  final String? value;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "attributedDecreasedValue": "<AttributedString>",
  ///   "attributedHint": "<AttributedString>",
  ///   "attributedIncreasedValue": "<AttributedString>",
  ///   "attributedLabel": "<AttributedString>",
  ///   "attributedValue": "<AttributedString>",
  ///   "customSemanticsActions": "<Map<CustomSemanticsAction, VoidCallback>>",
  ///   "button": "<bool>",
  ///   "checked": "<bool>",
  ///   "container": "<bool>",
  ///   "currentValueLength": "<int>",
  ///   "decreasedValue": "<String>",
  ///   "enabled": "<bool>",
  ///   "excludeSemantics": "<bool>",
  ///   "explicitChildNodes": "<bool>",
  ///   "focusable": "<bool>",
  ///   "focused": "<bool>",
  ///   "header": "<bool>",
  ///   "hidden": "<bool>",
  ///   "hint": "<String>",
  ///   "image": "<bool>",
  ///   "inMutuallyExclusiveGroup": "<bool>",
  ///   "increasedValue": "<String>",
  ///   "keyboardKey": "<bool>",
  ///   "label": "<String>",
  ///   "link": "<bool>",
  ///   "liveRegion": "<bool>",
  ///   "maxValueLength": "<int>",
  ///   "mixed": "<bool>",
  ///   "multiline": "<bool>",
  ///   "namesRoute": "<bool>",
  ///   "obscured": "<bool>",
  ///   "onCopy": "<VoidCallback>",
  ///   "onCut": "<VoidCallback>",
  ///   "onDecrease": "<VoidCallback>",
  ///   "onDidGainAccessibilityFocus": "<VoidCallback>",
  ///   "onDidLoseAccessibilityFocus": "<VoidCallback>",
  ///   "onDismiss": "<VoidCallback>",
  ///   "onIncrease": "<VoidCallback>",
  ///   "onLongPress": "<VoidCallback>",
  ///   "onLongPressHint": "<String>",
  ///   "onMoveCursorBackwardByCharacter": "<ValueChaned<bool>>",
  ///   "onMoveCursorForwardByCharacter": "<ValueChanged<bool>>",
  ///   "onPaste": "<VoidCallback>",
  ///   "onScrollDown": "<VoidCallback>",
  ///   "onScrollLeft": "<VoidCallback>",
  ///   "onScrollRight": "<VoidCallback>",
  ///   "onScrollUp": "<VoidCallback>",
  ///   "onSetSelection": "<ValueChanged<TextSelection>>",
  ///   "onSetText": "<ValueChanged<String>>",
  ///   "onTap": "<VoidCallback>",
  ///   "onTapHint": "<String>",
  ///   "readOnly": "<bool>",
  ///   "scopesRoute": "<bool>",
  ///   "selected": "<bool>",
  ///   "slider": "<bool>",
  ///   "sortKey": "<OrdinalSortKey>",
  ///   "tagForChildren": "<SemanticsTag>",
  ///   "textDirection": "<TextDirection>",
  ///   "textField": "<bool>",
  ///   "toggled": "<bool>",
  ///   "tooltip": "<String>",
  ///   "value": "<String>"
  /// }
  /// ```
  static JsonSemanticsBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSemanticsBuilder? result;

    if (map != null) {
      result = JsonSemanticsBuilder(
        button: JsonClass.maybeParseBool(map['button']),
        checked: JsonClass.maybeParseBool(map['checked']),
        container: JsonClass.parseBool(map['container']),
        currentValueLength: JsonClass.maybeParseInt(map['currentValueLength']),
        decreasedValue: map['decreasedValue'],
        enabled: map['enabled'] == null
            ? null
            : JsonClass.maybeParseBool(map['enabled']),
        excludeSemantics: JsonClass.parseBool(map['excludeSemantics']),
        explicitChildNodes: JsonClass.parseBool(map['explicitChildNodes']),
        focusable: JsonClass.maybeParseBool(map['focusable']),
        focused: JsonClass.maybeParseBool(map['focused']),
        header: JsonClass.maybeParseBool(map['header']),
        hidden: JsonClass.maybeParseBool(map['hidden']),
        hint: map['hint'],
        image: JsonClass.maybeParseBool(map['image']),
        inMutuallyExclusiveGroup: JsonClass.maybeParseBool(
          map['inMutuallyExclusiveGroup'],
        ),
        increasedValue: map['increasedValue'],
        keyboardKey: JsonClass.maybeParseBool(map['keyboardKey']),
        label: map['label'],
        link: JsonClass.maybeParseBool(map['link']),
        liveRegion: JsonClass.maybeParseBool(map['liveRegion']),
        maxValueLength: JsonClass.maybeParseInt(map['maxValueLength']),
        mixed: JsonClass.maybeParseBool(map['mixed']),
        multiline: JsonClass.maybeParseBool(map['multiline']),
        namesRoute: JsonClass.maybeParseBool(map['namesRoute']),
        obscured: JsonClass.maybeParseBool(map['obscured']),
        onCopy: map['onCopy'],
        onCut: map['onCut'],
        onDecrease: map['onDecrease'],
        onDidGainAccessibilityFocus: map['onDidGainAccessibilityFocus'],
        onDidLoseAccessibilityFocus: map['onDidLoseAccessibilityFocus'],
        onDismiss: map['onDismiss'],
        onIncrease: map['onIncrease'],
        onLongPress: map['onLongPress'],
        onLongPressHint: map['onLongPressHint'],
        onMoveCursorBackwardByCharacter: map['onMoveCursorBackwardByCharacter'],
        onMoveCursorForwardByCharacter: map['onMoveCursorForwardByCharacter'],
        onPaste: map['onPaste'],
        onScrollDown: map['onScrollDown'],
        onScrollLeft: map['onScrollLeft'],
        onScrollRight: map['onScrollRight'],
        onScrollUp: map['onScrollUp'],
        onSetSelection: map['onSetSelection'],
        onSetText: map['onSetText'],
        onTap: map['onTap'],
        onTapHint: map['onTapHint'],
        readOnly: JsonClass.maybeParseBool(map['readOnly']),
        scopesRoute: JsonClass.maybeParseBool(map['scopesRoute']),
        selected: JsonClass.maybeParseBool(map['selected']),
        slider: JsonClass.maybeParseBool(map['slider']),
        sortKey: ThemeDecoder.decodeOrdinalSortKey(
          map['sortKey'],
          validate: false,
        ),
        tagForChildren: ThemeDecoder.decodeSemanticsTag(
          map['tagForChildren'],
          validate: false,
        ),
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        ),
        textField: JsonClass.maybeParseBool(map['textField']),
        toggled: JsonClass.maybeParseBool(map['toggled']),
        tooltip: map['tooltip'],
        value: map['value'],
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

    return Semantics(
      attributedDecreasedValue: attributedDecreasedValue,
      attributedHint: attributedHint,
      attributedIncreasedValue: attributedIncreasedValue,
      attributedLabel: attributedLabel,
      attributedValue: attributedValue,
      button: button,
      customSemanticsActions: customSemanticsActions,
      checked: checked,
      container: container,
      currentValueLength: currentValueLength,
      decreasedValue: decreasedValue,
      enabled: enabled,
      excludeSemantics: excludeSemantics,
      explicitChildNodes: explicitChildNodes,
      focusable: focusable,
      focused: focused,
      header: header,
      hidden: hidden,
      hint: hint,
      image: image,
      inMutuallyExclusiveGroup: inMutuallyExclusiveGroup,
      increasedValue: increasedValue,
      key: key,
      keyboardKey: keyboardKey,
      label: label,
      link: link,
      liveRegion: liveRegion,
      maxValueLength: maxValueLength,
      mixed: mixed,
      multiline: multiline,
      namesRoute: namesRoute,
      obscured: obscured,
      onCopy: onCopy,
      onCut: onCut,
      onDecrease: onDecrease,
      onDidGainAccessibilityFocus: onDidGainAccessibilityFocus,
      onDidLoseAccessibilityFocus: onDidLoseAccessibilityFocus,
      onDismiss: onDismiss,
      onIncrease: onIncrease,
      onLongPress: onLongPress,
      onLongPressHint: onLongPressHint,
      onMoveCursorBackwardByCharacter: onMoveCursorBackwardByCharacter,
      onMoveCursorForwardByCharacter: onMoveCursorForwardByCharacter,
      onPaste: onPaste,
      onScrollDown: onScrollDown,
      onScrollLeft: onScrollLeft,
      onScrollRight: onScrollRight,
      onScrollUp: onScrollUp,
      onSetSelection: onSetSelection,
      onSetText: onSetText,
      onTap: onTap,
      onTapHint: onTapHint,
      readOnly: readOnly,
      scopesRoute: scopesRoute,
      selected: selected,
      slider: slider,
      sortKey: sortKey,
      tagForChildren: tagForChildren,
      textDirection: textDirection,
      textField: textField,
      toggled: toggled,
      tooltip: tooltip,
      value: value,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
