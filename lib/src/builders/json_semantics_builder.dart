import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Semantics] widget.  See the [fromDynamic] for the
/// format.
class JsonSemanticsBuilder extends JsonWidgetBuilder {
  JsonSemanticsBuilder({
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
  final String? value;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "attributedDecreasedValue": <AttributedString>,
  ///   "attributedHint": <AttributedString>,
  ///   "attributedIncreasedValue": <AttributedString>,
  ///   "attributedLabel": <AttributedString>,
  ///   "attributedValue": <AttributedString>,
  ///   "customSemanticsActions": <Map<CustomSemanticsAction, VoidCallback>>,
  ///   "button": <bool>,
  ///   "checked": <bool>,
  ///   "container": <bool>,
  ///   "currentValueLength": <int>,
  ///   "decreasedValue": <String>,
  ///   "enabled": <bool>,
  ///   "excludeSemantics": <bool>,
  ///   "explicitChildNodes": <bool>,
  ///   "focusable": <bool>,
  ///   "focused": <bool>,
  ///   "header": <bool>,
  ///   "hidden": <bool>,
  ///   "hint": <String>>,
  ///   "image": <bool>,
  ///   "inMutuallyExclusiveGroup": <bool>
  ///   "increasedValue": <String>,
  ///   "keyboardKey": <bool>,
  ///   "label": <String>,
  ///   "link": <bool>,
  ///   "liveRegion": <bool>,
  ///   "maxValueLength": <int>,
  ///   "multiline": <bool>,
  ///   "namesRoute": <bool>,
  ///   "obscured": <bool>,
  ///   "onCopy": <VoidCallback>,
  ///   "onCut": <VoidCallback>,
  ///   "onDecrease": <VoidCallback>,
  ///   "onDidGainAccessibilityFocus": <VoidCallback>,
  ///   "onDidLoseAccessibilityFocus": <VoidCallback>,
  ///   "onDismiss": <VoidCallback>,
  ///   "onIncrease": <VoidCallback>,
  ///   "onLongPress": <VoidCallback>,
  ///   "onLongPressHint": <String>,
  ///   "onMoveCursorBackwardByCharacter": <ValueChaned<bool>>,
  ///   "onMoveCursorForwardByCharacter": <ValueChanged<bool>>,
  ///   "onPaste": <VoidCallback>,
  ///   "onScrollDown": <VoidCallback>,
  ///   "onScrollLeft": <VoidCallback>,
  ///   "onScrollRight": <VoidCallback>,
  ///   "onScrollUp": <VoidCallback>,
  ///   "onSetSelection": <ValueChanged<TextSelection>>,
  ///   "onSetText": <ValueChanged<String>>,
  ///   "onTap": <VoidCallback>,
  ///   "onTapHint": <String>,
  ///   "readOnly": <bool>,
  ///   "scopesRoute": <bool>,
  ///   "selected": <bool>,
  ///   "slider": <bool>,
  ///   "sortKey": <OrdinalSortKey>,
  ///   "tagForChildren": <SemanticsTag>,
  ///   "textDirection": <TextDirection>,
  ///   "textField": <bool>,
  ///   "toggled": <bool>,
  ///   "value": <String>
  /// }
  /// ```
  static JsonSemanticsBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonSemanticsBuilder? result;

    if (map != null) {
      result = JsonSemanticsBuilder(
        button:
            map['button'] == null ? null : JsonClass.parseBool(map['button']),
        checked:
            map['checked'] == null ? null : JsonClass.parseBool(map['checked']),
        container: JsonClass.parseBool(map['container']),
        currentValueLength: JsonClass.parseInt(map['currentValueLength']),
        decreasedValue: map['decreasedValue'],
        enabled:
            map['enabled'] == null ? null : JsonClass.parseBool(map['enabled']),
        excludeSemantics: JsonClass.parseBool(map['excludeSemantics']),
        explicitChildNodes: JsonClass.parseBool(map['explicitChildNodes']),
        focusable: map['focusable'] == null
            ? null
            : JsonClass.parseBool(map['focusable']),
        focused:
            map['focused'] == null ? null : JsonClass.parseBool(map['focused']),
        header:
            map['header'] == null ? null : JsonClass.parseBool(map['header']),
        hidden:
            map['hidden'] == null ? null : JsonClass.parseBool(map['hidden']),
        hint: map['hint'],
        image: map['image'] == null ? null : JsonClass.parseBool(map['image']),
        inMutuallyExclusiveGroup:
            JsonClass.parseBool(map['inMutuallyExclusiveGroup']),
        increasedValue: map['increasedValue'],
        keyboardKey: map['keyboardKey'] == null
            ? null
            : JsonClass.parseBool(map['keyboardKey']),
        label: map['label'],
        link: map['link'] == null ? null : JsonClass.parseBool(map['link']),
        liveRegion: map['liveRegion'] == null
            ? null
            : JsonClass.parseBool(map['liveRegion']),
        maxValueLength: map['maxValueLength'] == null
            ? null
            : JsonClass.parseInt(map['maxValueLength']),
        multiline: map['multiline'] == null
            ? null
            : JsonClass.parseBool(map['multiline']),
        namesRoute: map['namesRoute'] == null
            ? null
            : JsonClass.parseBool(map['namesRoute']),
        obscured: map['obscured'] == null
            ? null
            : JsonClass.parseBool(map['obscured']),
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
        readOnly: map['readOnly'] == null
            ? null
            : JsonClass.parseBool(map['readOnly']),
        scopesRoute: map['scopesRoute'] == null
            ? null
            : JsonClass.parseBool(map['scopesRoute']),
        selected: map['selected'] == null
            ? null
            : JsonClass.parseBool(map['selected']),
        slider:
            map['slider'] == null ? null : JsonClass.parseBool(map['slider']),
        sortKey: ThemeDecoder.decodeOrdinalSortKey(map['sortKey']),
        tagForChildren: ThemeDecoder.decodeSemanticsTag(map['tagForChildren']),
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
        textField: map['textField'] == null
            ? null
            : JsonClass.parseBool(map['textField']),
        toggled:
            map['toggled'] == null ? null : JsonClass.parseBool(map['toggled']),
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
    var child = getChild(data);

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
      value: value,
      child: child.build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
