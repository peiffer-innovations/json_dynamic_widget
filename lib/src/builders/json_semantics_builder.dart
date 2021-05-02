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
    this.button,
    this.checked,
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

  final bool? button;
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
        button: JsonClass.parseBool(map['button']),
        checked: JsonClass.parseBool(map['button']),
        container: JsonClass.parseBool(map['button']),
        currentValueLength: JsonClass.parseInt(map['button']),
        decreasedValue: map['button'],
        enabled: JsonClass.parseBool(map['button']),
        excludeSemantics: JsonClass.parseBool(map['button']),
        explicitChildNodes: JsonClass.parseBool(map['button']),
        focusable: JsonClass.parseBool(map['button']),
        focused: JsonClass.parseBool(map['button']),
        header: JsonClass.parseBool(map['button']),
        hidden: JsonClass.parseBool(map['button']),
        hint: map['button'],
        image: JsonClass.parseBool(map['button']),
        inMutuallyExclusiveGroup: JsonClass.parseBool(map['button']),
        increasedValue: map['button'],
        label: map['button'],
        link: JsonClass.parseBool(map['button']),
        liveRegion: JsonClass.parseBool(map['button']),
        maxValueLength: JsonClass.parseInt(map['button']),
        multiline: JsonClass.parseBool(map['button']),
        namesRoute: JsonClass.parseBool(map['button']),
        obscured: JsonClass.parseBool(map['button']),
        onCopy: map['onCopy'],
        onCut: map['onCopy'],
        onDecrease: map['onCopy'],
        onDidGainAccessibilityFocus: map['onCopy'],
        onDidLoseAccessibilityFocus: map['onCopy'],
        onDismiss: map['onCopy'],
        onIncrease: map['onCopy'],
        onLongPress: map['onCopy'],
        onLongPressHint: map['onCopy'],
        onMoveCursorBackwardByCharacter: map['onCopy'],
        onMoveCursorForwardByCharacter: map['onCopy'],
        onPaste: map['onCopy'],
        onScrollDown: map['onCopy'],
        onScrollLeft: map['onCopy'],
        onScrollRight: map['onCopy'],
        onScrollUp: map['onCopy'],
        onSetSelection: map['onCopy'],
        onTap: map['onCopy'],
        onTapHint: map['onCopy'],
        readOnly: JsonClass.parseBool(map['button']),
        scopesRoute: JsonClass.parseBool(map['button']),
        selected: JsonClass.parseBool(map['button']),
        slider: JsonClass.parseBool(map['button']),
        sortKey: ThemeDecoder.decodeOrdinalSortKey(map['sortKey']),
        tagForChildren: ThemeDecoder.decodeSemanticsTag(map['tagForChildren']),
        textDirection: ThemeDecoder.decodeTextDirection(map['button']),
        textField: JsonClass.parseBool(map['button']),
        toggled: JsonClass.parseBool(map['button']),
        value: map['button'],
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
      button: button,
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
