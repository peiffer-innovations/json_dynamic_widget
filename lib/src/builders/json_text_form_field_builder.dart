import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_form_field_builder.g.dart';

@jsonWidget
abstract class _JsonTextFormFieldBuilder extends JsonWidgetBuilder {
  const _JsonTextFormFieldBuilder();

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

  @JsonArgDecoder('validators')
  Validator? _decodeValidators({required dynamic value}) => value == null
      ? null
      : Validator.fromDynamic(
          {'validators': value},
        );

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
    this.contextMenuBuilder,
    required this.controller,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    @JsonBuildArg() required this.data,
    this.decoration,
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
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
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
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.strutStyle,
    this.style,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.validators,
  });

  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final InputCounterWidgetBuilder? buildCounter;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextEditingController? controller;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final JsonWidgetData data;
  final dynamic decoration;
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
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int maxLines;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool obscureText;
  final String obscuringCharacter;
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
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
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

    widget.data.registry.valueStream
        .where((event) => !event.isSelfTriggered && event.id == widget.data.id)
        .listen(
      (event) {
        final value = widget.data.registry.getValue(widget.data.id);
        final textValue = _controller.value.copyWith(
          text: value,
          selection: TextSelection(
            baseOffset: value.length,
            extentOffset: value.length,
          ),
          composing: TextRange(
            start: 0,
            end: value.length,
          ),
        );
        _controller.value = textValue;
      },
    );

    _controller.addListener(() {
      if (widget.data.id.isNotEmpty == true && _text != _controller.text) {
        _text = _controller.text;
        widget.data.registry.setValue(
          widget.data.id,
          _text,
          originator: widget.data.id,
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
        contextMenuBuilder: widget.contextMenuBuilder,
        controller: widget.controller,
        cursorColor: widget.cursorColor,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorWidth: widget.cursorWidth,
        decoration: widget.decoration,
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
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        mouseCursor: widget.mouseCursor,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        onChanged: widget.enabled != true
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
        showCursor: widget.showCursor,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        strutStyle: widget.strutStyle,
        style: widget.style,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textCapitalization: widget.textCapitalization,
        textDirection: widget.textDirection,
        textInputAction: widget.textInputAction,
        validator: widget.validators == null
            ? null
            : (value) {
                final error = widget.validators!.validate(
                  label: widget.decoration?.labelText ?? '',
                  value: value?.toString(),
                );

                widget.data.registry.setValue(
                  '${widget.data.id}.error',
                  error ?? '',
                  originator: widget.data.id,
                );

                return error;
              },
      );
}
