import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/form_validation.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [TextFormField] widget.  See the [fromDynamic] for
/// the format.
class JsonTextFormFieldBuilder extends JsonWidgetBuilder {
  JsonTextFormFieldBuilder({
    this.autocorrect,
    this.autofocus,
    this.autovalidate,
    this.buildCounter,
    this.controller,
    this.cursorColor,
    this.cursorRadius,
    this.cursorWidth,
    this.decoration,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.enabled,
    this.expands,
    this.focusNode,
    this.initialValue,
    this.inputFormatters,
    this.keyboardAppearance,
    this.keyboardType,
    this.maxLength,
    this.maxLengthEnforced,
    this.maxLines,
    this.minLines,
    this.obscureText,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly,
    this.scrollPadding,
    this.scrollPhysics,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textAlignVertical,
    this.textCapitalization,
    this.textDirection,
    this.textInputAction,
    this.toolbarOptions,
    this.validator,
  });

  static const type = 'text_form_field';

  final bool autocorrect;
  final bool autofocus;
  final bool autovalidate;
  final InputCounterWidgetBuilder buildCounter;
  final TextEditingController controller;
  final Color cursorColor;
  final Radius cursorRadius;
  final double cursorWidth;
  final dynamic decoration;
  final bool enableInteractiveSelection;
  final bool enableSuggestions;
  final bool enabled;
  final bool expands;
  final FocusNode focusNode;
  final String initialValue;
  final List<TextInputFormatter> inputFormatters;
  final Brightness keyboardAppearance;
  final TextInputType keyboardType;
  final int maxLength;
  final bool maxLengthEnforced;
  final int maxLines;
  final int minLines;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final VoidCallback onTap;
  final bool readOnly;
  final EdgeInsetsGeometry scrollPadding;
  final ScrollPhysics scrollPhysics;
  final bool showCursor;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final StrutStyle strutStyle;
  final TextStyle style;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection textDirection;
  final TextInputAction textInputAction;
  final ToolbarOptions toolbarOptions;
  final Validator validator;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autocorrect": <bool>,
  ///   "autofocus": <bool>
  ///   "autovalidate": <bool>,
  ///   "buildCounter": <InputCounterWidgetBuilder>,
  ///   "controller": <TextEditingController>,
  ///   "cursorColor": <Color>,
  ///   "cursorRadius": <Radius>,
  ///   "cursorWidth": <double>,
  ///   "decoration": <InputDecorationDecoder>,
  ///   "enableInteractiveSelection": <bool>,
  ///   "enableSuggestions": <bool>,
  ///   "enabled": <bool>,
  ///   "expands": <bool>,
  ///   "focusNode": <FocusNode>,
  ///   "initialValue": <String>,
  ///   "inputFormatters": <List<TextInputFormatter>>,
  ///   "keyboardAppearance": <Brightness>,
  ///   "keyboardType": <TextInputType>,
  ///   "maxLength": <int>,
  ///   "maxLengthEnforced": <bool>,
  ///   "maxLines": <int>,
  ///   "minLines": <int>,
  ///   "obscureText": <bool>,
  ///   "onChanged": <ValueChanged<String>>
  ///   "onEditingComplete": <VoidCallback>,
  ///   "onFieldSubmitted": <ValueChanged<String>>
  ///   "onSaved": <FormFieldSetter<String>>
  ///   "onTap": <VoidCallback>,
  ///   "readOnly": <bool>,
  ///   "scrollPadding": <EdgeInsetsGeometry>,
  ///   "scrollPhysics": <ScrollPhysics>,
  ///   "showCursor": <bool>,
  ///   "smartDashesType": <SmartDashesType>,
  ///   "smartQuotesType": <SmartQuotesType>,
  ///   "strutStyle": <StrutStyle>,
  ///   "style": <TextStyle>,
  ///   "textAlign": <TextAlign>,
  ///   "textAlignVertical": <TextAlignVertical>,
  ///   "textCapitalization": <TextCapitalization>,
  ///   "textDirection": <TextDirection>,
  ///   "textInputAction": <TextInputAction>,
  ///   "toolbarOptions": <ToolbarOptions>,
  ///   "validators": <ValueValidator[]>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [InputDecorationDecoder.fromDynamic]
  ///  * [ThemeDecoder.decodeBrightness]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeEdgeInsetsGeometry]
  ///  * [ThemeDecoder.decodeRadius]
  ///  * [ThemeDecoder.decodeScrollPhysics]
  ///  * [ThemeDecoder.decodeSmartDashesType]
  ///  * [ThemeDecoder.decodeSmartQuotesType]
  ///  * [ThemeDecoder.decodeTextAlign]
  ///  * [ThemeDecoder.decodeTextAlignVertical]
  ///  * [ThemeDecoder.decodeTextCapitalization]
  ///  * [ThemeDecoder.decodeTextInputAction]
  ///  * [ThemeDecoder.decodeTextInputType]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [ThemeDecoder.decodeToolbarOptions]
  ///  * [Validator]
  static JsonTextFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonTextFormFieldBuilder result;
    if (map != null) {
      result = JsonTextFormFieldBuilder(
        autocorrect: map['autocorrect'] == null
            ? true
            : JsonClass.parseBool(map['autocorrect']),
        autofocus: JsonClass.parseBool(map['autofocus']),
        autovalidate: JsonClass.parseBool(map['autovalidate']),
        buildCounter: map['buildCounter'],
        controller: map['controller'],
        cursorColor: ThemeDecoder.decodeColor(map['cursorColor']),
        cursorRadius: ThemeDecoder.decodeRadius(map['cursorRadius']),
        cursorWidth: JsonClass.parseDouble(map['cursorWidth'], 2),
        decoration: map['decoration'],
        enableInteractiveSelection: map['enableInteractiveSelection'] == null
            ? true
            : JsonClass.parseBool(map['enableInteractiveSelection']),
        enableSuggestions: map['enableSuggestions'] == null
            ? true
            : JsonClass.parseBool(map['enableSuggestions']),
        enabled:
            map['enabled'] == null ? true : JsonClass.parseBool(map['enabled']),
        expands: JsonClass.parseBool(map['expands']),
        focusNode: map['focusNode'],
        initialValue: map['initialValue'],
        inputFormatters: map['inputFormatters'],
        keyboardAppearance:
            ThemeDecoder.decodeBrightness(map['keyboardBrightness']),
        keyboardType: ThemeDecoder.decodeTextInputType(map['keyboardType']),
        maxLength: JsonClass.parseInt(map['maxLength']),
        maxLengthEnforced: JsonClass.parseBool(map['maxLengthEnforced']),
        maxLines: JsonClass.parseInt(map['maxLines'], 1),
        minLines: JsonClass.parseInt(map['minLines']),
        obscureText: JsonClass.parseBool(map['obscureText']),
        onChanged: map['onChanged'],
        onEditingComplete: map['onEditingComplete'],
        onFieldSubmitted: map['onFieldSubmitted'],
        onSaved: map['onSaved'],
        onTap: map['onTap'],
        readOnly: JsonClass.parseBool(map['readOnly']),
        scrollPadding:
            ThemeDecoder.decodeEdgeInsetsGeometry(map['scrollPadding']) ??
                EdgeInsets.all(20.0),
        scrollPhysics: ThemeDecoder.decodeScrollPhysics(map['scrollPhysics']),
        showCursor: JsonClass.parseBool(map['showCursor']),
        smartDashesType:
            ThemeDecoder.decodeSmartDashesType(map['smartDashesType']),
        smartQuotesType:
            ThemeDecoder.decodeSmartQuotesType(map['smartQuotesType']),
        strutStyle: ThemeDecoder.decodeStrutStyle(map['strutStyle']),
        style: ThemeDecoder.decodeTextStyle(map['style']),
        textAlign:
            ThemeDecoder.decodeTextAlign(map['textAlign']) ?? TextAlign.start,
        textAlignVertical:
            ThemeDecoder.decodeTextAlignVertical(map['textAlignVertical']),
        textCapitalization:
            ThemeDecoder.decodeTextCapitalization(map['textCapitalization']) ??
                TextCapitalization.none,
        textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
        textInputAction:
            ThemeDecoder.decodeTextInputAction(map['textInputAction']),
        toolbarOptions:
            ThemeDecoder.decodeToolbarOptions(map['toolbarOptions']),
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({
                'validators': map['validators'],
              }),
      );
    }

    return result;
  }

  /// Removes any / all values this builder may have set from the
  /// [JsonWidgetRegistry].
  @override
  void remove(JsonWidgetData data) {
    if (data.id?.isNotEmpty == true) {
      data.registry.removeValue(data.id);
    }

    super.remove(data);
  }

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the input value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[JsonTextFormFieldBuilder] does not support children.',
    );

    return _JsonTextFormFieldWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonTextFormFieldWidget extends StatefulWidget {
  _JsonTextFormFieldWidget({
    this.builder,
    this.childBuilder,
    this.data,
    Key key,
  }) : super(key: key);

  final JsonTextFormFieldBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonTextFormFieldWidgetState createState() =>
      _JsonTextFormFieldWidgetState();
}

class _JsonTextFormFieldWidgetState extends State<_JsonTextFormFieldWidget> {
  InputDecoration _decoration;

  @override
  void initState() {
    super.initState();

    if (widget.builder.decoration != null) {
      _decoration = InputDecorationDecoder.fromDynamic(
        widget.builder.decoration,
        childBuilder: widget.childBuilder,
        context: context,
        registry: widget.data.registry,
      );
    }
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        autocorrect: widget.builder.autocorrect,
        autofocus: widget.builder.autofocus,
        autovalidate: widget.builder.autovalidate,
        buildCounter: widget.builder.buildCounter,
        controller: widget.builder.controller,
        cursorColor: widget.builder.cursorColor,
        cursorRadius: widget.builder.cursorRadius,
        cursorWidth: widget.builder.cursorWidth,
        decoration: _decoration ?? const InputDecoration(),
        enableInteractiveSelection: widget.builder.enableInteractiveSelection,
        enableSuggestions: widget.builder.enableSuggestions,
        enabled: widget.builder.enabled,
        expands: widget.builder.expands,
        focusNode: widget.builder.focusNode,
        initialValue: widget.builder.initialValue,
        inputFormatters: widget.builder.inputFormatters,
        keyboardAppearance: widget.builder.keyboardAppearance,
        keyboardType: widget.builder.keyboardType,
        maxLength: widget.builder.maxLength,
        maxLengthEnforced: widget.builder.maxLengthEnforced,
        maxLines: widget.builder.maxLines,
        minLines: widget.builder.minLines,
        obscureText: widget.builder.obscureText,
        onChanged: widget.builder.enabled != true
            ? null
            : (value) {
                if (widget.builder.onChanged != null) {
                  widget.builder.onChanged(value);
                }

                if (widget.data.id?.isNotEmpty == true) {
                  widget.data.registry.setValue(widget.data.id, value);
                }
              },
        onEditingComplete: widget.builder.onEditingComplete,
        onFieldSubmitted: widget.builder.onFieldSubmitted,
        onSaved: widget.builder.onSaved,
        onTap: widget.builder.onTap,
        readOnly: widget.builder.readOnly,
        scrollPadding: widget.builder.scrollPadding,
        scrollPhysics: widget.builder.scrollPhysics,
        showCursor: widget.builder.showCursor,
        smartDashesType: widget.builder.smartDashesType,
        smartQuotesType: widget.builder.smartQuotesType,
        strutStyle: widget.builder.strutStyle,
        style: widget.builder.style,
        textAlign: widget.builder.textAlign,
        textAlignVertical: widget.builder.textAlignVertical,
        textCapitalization: widget.builder.textCapitalization,
        textDirection: widget.builder.textDirection,
        textInputAction: widget.builder.textInputAction,
        toolbarOptions: widget.builder.toolbarOptions,
        validator: widget.builder.validator == null
            ? null
            : (value) {
                var error = widget.builder.validator.validate(
                  context: context,
                  label: _decoration?.labelText ?? '',
                  value: value?.toString(),
                );

                if (widget.data.id?.isNotEmpty == true) {
                  widget.data.registry
                      .setValue('${widget.data.id}.error', error ?? '');
                }

                return error;
              },
      );
}
