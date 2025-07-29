import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_form_field_builder.g.dart';

@jsonWidget
abstract class _JsonTextFormFieldBuilder extends JsonWidgetBuilder {
  const _JsonTextFormFieldBuilder({required super.args});

  @JsonArgSchema('decoration')
  static Map<String, dynamic> _inputDecorationSchema() {
    final schema = InputDecorationDecoder.schema;
    SchemaCache().addSchema(InputDecorationDecoder.schemaId, schema);
    return SchemaHelper.objectSchema(InputDecorationDecoder.schemaId);
  }

  @JsonArgDecoder('decoration')
  InputDecoration? _decodeInputDecoration({
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetRegistry registry,
    required dynamic value,
  }) =>
      InputDecorationDecoder.fromDynamic(
        value,
        childBuilder: childBuilder,
        context: context,
        registry: registry,
      ) ??
      const InputDecoration();

  @JsonArgDecoder('autofillHints')
  Iterable<String>? _decodeAutofillHints({required dynamic value}) {
    if (value is Iterable) {
      return value.cast<String>();
    }
    return null;
  }

  @JsonArgDecoder('validators')
  Validator? _decodeValidators({required dynamic value}) =>
      value == null ? null : Validator.fromDynamic({'validators': value});

  @override
  _TextFormField buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _TextFormField extends StatefulWidget {
  const _TextFormField({
    this.autocorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.autovalidateMode,
    this.buildCounter,
    this.canRequestFocus = true,
    this.clipBehavior = Clip.hardEdge,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    required this.controller,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    @JsonBuildArg() required this.data,
    this.decoration,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
    this.enableSuggestions = true,
    this.enabled,
    this.expands = false,
    this.focusNode,
    this.initialValue,
    this.inputFormatters,
    this.keyboardAppearance,
    this.keyboardType,
    this.magnifierConfiguration,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.onAppPrivateCommand,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.onTapOutside,
    this.readOnly = false,
    this.restorationId,
    this.scrollController,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.strutStyle,
    this.style,
    this.stylusHandwritingEnabled = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.undoController,
    this.validators,
  });

  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final InputCounterWidgetBuilder? buildCounter;
  final bool canRequestFocus;
  final Clip clipBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextEditingController? controller;
  final Color? cursorColor;
  final double? cursorHeight;
  final bool? cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double cursorWidth;
  final JsonWidgetData data;
  final dynamic decoration;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool? enabled;
  final bool expands;
  final FocusNode? focusNode;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool obscureText;
  final String obscuringCharacter;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final bool readOnly;
  final String? restorationId;
  final ScrollController? scrollController;
  final EdgeInsets scrollPadding;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final bool stylusHandwritingEnabled;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final UndoHistoryController? undoController;
  final Validator? validators;

  @override
  State createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  late final TextEditingController _controller;
  String _text = '';

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    final initialValue = widget.initialValue;
    if (initialValue != null) {
      _controller.text = initialValue;
    }

    widget.data.jsonWidgetRegistry.valueStream
        .where(
          (event) =>
              !event.isSelfTriggered && event.id == widget.data.jsonWidgetId,
        )
        .listen((event) {
          final value = widget.data.jsonWidgetRegistry.getValue(
            widget.data.jsonWidgetId,
          );
          final textValue = _controller.value.copyWith(
            text: value,
            selection: TextSelection(
              baseOffset: value.length,
              extentOffset: value.length,
            ),
            composing: TextRange(start: 0, end: value.length),
          );
          _controller.value = textValue;
        });

    _controller.addListener(() {
      if (widget.data.jsonWidgetId.isNotEmpty == true &&
          _text != _controller.text) {
        _text = _controller.text;
        widget.data.jsonWidgetRegistry.setValue(
          widget.data.jsonWidgetId,
          _text,
          originator: widget.data.jsonWidgetId,
        );
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    autocorrect: widget.autocorrect,
    autofillHints: widget.autofillHints,
    autofocus: widget.autofocus,
    autovalidateMode: widget.autovalidateMode,
    buildCounter: widget.buildCounter,
    canRequestFocus: widget.canRequestFocus,
    clipBehavior: widget.clipBehavior,
    contentInsertionConfiguration: widget.contentInsertionConfiguration,
    contextMenuBuilder: widget.contextMenuBuilder,
    controller: _controller,
    cursorColor: widget.cursorColor,
    cursorHeight: widget.cursorHeight,
    cursorOpacityAnimates: widget.cursorOpacityAnimates,
    cursorRadius: widget.cursorRadius,
    cursorWidth: widget.cursorWidth,
    decoration: widget.decoration,
    dragStartBehavior: widget.dragStartBehavior,
    enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
    enableInteractiveSelection: widget.enableInteractiveSelection,
    enableSuggestions: widget.enableSuggestions,
    enabled: widget.enabled,
    expands: widget.expands,
    focusNode: widget.focusNode,
    // initialValue: <controller is required, so this can never be set>,
    inputFormatters: widget.inputFormatters,
    keyboardAppearance: widget.keyboardAppearance,
    keyboardType: widget.keyboardType,
    magnifierConfiguration: widget.magnifierConfiguration,
    maxLength: widget.maxLength,
    maxLengthEnforcement: widget.maxLengthEnforcement,
    maxLines: widget.maxLines,
    minLines: widget.minLines,
    mouseCursor: widget.mouseCursor,
    obscuringCharacter: widget.obscuringCharacter,
    obscureText: widget.obscureText,
    onAppPrivateCommand: widget.onAppPrivateCommand,
    onChanged:
        widget.enabled != true
            ? null
            : (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
    onEditingComplete: widget.onEditingComplete,
    onFieldSubmitted: widget.onFieldSubmitted,
    onSaved: widget.onSaved,
    onTap: widget.onTap,
    onTapOutside: widget.onTapOutside,
    readOnly: widget.readOnly,
    restorationId: widget.restorationId,
    scrollController: widget.scrollController,
    scrollPadding: widget.scrollPadding,
    scrollPhysics: widget.scrollPhysics,
    selectionControls: widget.selectionControls,
    selectionHeightStyle: widget.selectionHeightStyle,
    selectionWidthStyle: widget.selectionWidthStyle,
    showCursor: widget.showCursor,
    smartDashesType: widget.smartDashesType,
    smartQuotesType: widget.smartQuotesType,
    spellCheckConfiguration: widget.spellCheckConfiguration,
    strutStyle: widget.strutStyle,
    style: widget.style,
    stylusHandwritingEnabled: widget.stylusHandwritingEnabled,
    textAlign: widget.textAlign,
    textAlignVertical: widget.textAlignVertical,
    textCapitalization: widget.textCapitalization,
    textDirection: widget.textDirection,
    textInputAction: widget.textInputAction,
    // @deprecated toolbarOptions
    undoController: widget.undoController,
    validator:
        widget.validators == null
            ? null
            : (value) {
              final error = widget.validators!.validate(
                label: widget.decoration?.labelText ?? '',
                value: value?.toString(),
              );

              widget.data.jsonWidgetRegistry.setValue(
                '${widget.data.jsonWidgetId}.error',
                error ?? '',
                originator: widget.data.jsonWidgetId,
              );

              return error;
            },
  );
}
