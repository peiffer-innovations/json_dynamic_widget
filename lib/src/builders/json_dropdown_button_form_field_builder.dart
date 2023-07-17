import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [DropdownButtonFormField] widget.  See the
/// [fromDynamic] for the format.
class JsonDropdownButtonFormFieldBuilder extends JsonWidgetBuilder {
  const JsonDropdownButtonFormFieldBuilder({
    this.alignment,
    this.autofocus,
    this.autovalidateMode,
    this.borderRadius,
    this.decoration,
    this.disabledHint,
    this.dropdownColor,
    this.elevation,
    this.enableFeedback,
    this.enabled,
    this.focusColor,
    this.focusNode,
    this.hint,
    this.icon,
    this.iconSize,
    this.items,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.isDense,
    this.isExpanded,
    this.itemHeight,
    this.menuMaxHeight,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.selectedItemBuilder,
    this.validator,
    this.style,
    this.value,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const type = 'dropdown_button_form_field';

  final Alignment? alignment;
  final bool? autofocus;
  final AutovalidateMode? autovalidateMode;
  final BorderRadius? borderRadius;
  final dynamic decoration;
  final JsonWidgetData? disabledHint;
  final Color? dropdownColor;
  final int? elevation;
  final bool? enableFeedback;
  final bool? enabled;
  final Color? focusColor;
  final FocusNode? focusNode;
  final JsonWidgetData? hint;
  final JsonWidgetData? icon;
  final dynamic items;
  final Color? iconDisabledColor;
  final double? iconSize;
  final Color? iconEnabledColor;
  final bool? isDense;
  final bool? isExpanded;
  final double? itemHeight;
  final double? menuMaxHeight;
  final ValueChanged? onChanged;
  final FormFieldSetter? onSaved;
  final VoidCallback? onTap;
  final dynamic selectedItemBuilder;
  final Validator? validator;
  final TextStyle? style;
  final dynamic value;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": "<Alignment>",
  ///   "autofocus": "<bool>",
  ///   "autovalidateMode": "<AutovalidateMode>",
  ///   "borderRadius": "<BorderRadius>",
  ///   "decoration": "<InputDecorationDecoder>",
  ///   "disabledHint": "<JsonWidgetData>",
  ///   "dropdownColor": "<Color>",
  ///   "elevation": "<int>",
  ///   "enabled": "<bool>",
  ///   "focusColor": "<Color>",
  ///   "focusNode": "<FocusNode>",
  ///   "hint": "<JsonWidgetData>",
  ///   "icon": "<JsonWidgetData>",
  ///   "items": "<List<String>> || <Map<String, dynamic>>",
  ///   "iconDisabledColor": "<Color>",
  ///   "iconEnabledColor": "<Color>",
  ///   "iconSize": "<double>",
  ///   "isDense": "<bool>",
  ///   "isExpanded": "<bool>",
  ///   "itemHeight": "<double>",
  ///   "onChanged": "<ValueChanged>",
  ///   "onSaved": "<FormFieldSetter>",
  ///   "onTap": "<VoidCallback>",
  ///   "selectedItemBuilder": "<DropdownButtonBuilder> || <JsonWidgetData>",
  ///   "validators": "<List<ValueValidator>>",
  ///   "style": "<TextStyle>",
  ///   "value": "<dynamic>"
  /// }
  /// ```
  ///
  /// As a note, the [FocusNode], [ValueChanged], [FormFieldSetter], and
  /// [VoidCallback] objects cannot be decoded via JSON.  Instead, the only way
  /// to bind those values to the builder is to use a function or a variable
  /// reference via the [JsonWidgetRegistry].
  ///
  /// The `selectedItemBuilder` can be a [DropdownButtonBuilder] or
  /// [JsonWidgetData].  The [DropdownButtonBuilder] cannot be decoded via JSON
  /// and would have to be bound via the [JsonWidgetRegistry].  If a
  /// [JsonWidgetData] object is used then the item's display will be bound to
  /// the `dropdown_item_display` variable on the registry and the item's value
  /// will be bound to `dropdown_item_value`.  This way the widget can associate
  /// properties to those two keys for proper rendering.
  ///
  /// The `items` can be either a string array where the string will be used for
  /// both the display and the value or a map of strings to values where the key
  /// will be used as the display and the value will be the internal dropdown
  /// value.
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [InputDecorationDecoder.fromDynamic]
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [Validator]
  static JsonDropdownButtonFormFieldBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonDropdownButtonFormFieldBuilder? result;

    if (map != null) {
      result = JsonDropdownButtonFormFieldBuilder(
        alignment: ThemeDecoder.decodeAlignment(
          map['alignment'],
          validate: false,
        ),
        autofocus: JsonClass.maybeParseBool(map['autofocus']),
        autovalidateMode: map['autovalidate'] == null
            ? ThemeDecoder.decodeAutovalidateMode(
                map['autovalidateMode'],
                validate: false,
              )
            : JsonClass.maybeParseBool(map['autovalidate']) == true
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        borderRadius: ThemeDecoder.decodeBorderRadius(
          map['borderRadius'],
          validate: false,
        ),
        decoration: map['decoration'],
        disabledHint: JsonWidgetData.fromDynamic(map['disabledHint']),
        dropdownColor: ThemeDecoder.decodeColor(
          map['dropdownColor'],
          validate: false,
        ),
        elevation: JsonClass.maybeParseInt(map['elevation']) ?? 8,
        enableFeedback: JsonClass.parseBool(
          map['enableFeedback'],
          whenNull: true,
        ),
        enabled: map['enabled'] == null
            ? true
            : JsonClass.maybeParseBool(map['enabled']),
        hint: JsonWidgetData.fromDynamic(map['hint']),
        icon: JsonWidgetData.fromDynamic(map['icon']),
        items: map['items'],
        iconDisabledColor: ThemeDecoder.decodeColor(
          map['iconDisabledColor'],
          validate: false,
        ),
        iconEnabledColor: ThemeDecoder.decodeColor(
          map['iconEnabledColor'],
          validate: false,
        ),
        iconSize: JsonClass.maybeParseDouble(map['iconSize'], 24.0),
        isDense: JsonClass.parseBool(
          map['isDense'],
          whenNull: true,
        ),
        isExpanded: JsonClass.maybeParseBool(map['isExpanded']),
        itemHeight: JsonClass.maybeParseDouble(map['itemHeight']),
        menuMaxHeight: JsonClass.maybeParseDouble(map['menuMaxHeight']),
        onChanged: map['onChanged'],
        onSaved: map['onSaved'],
        onTap: map['onTap'],
        selectedItemBuilder: map['selectedItemBuilder'],
        style: ThemeDecoder.decodeTextStyle(
          map['style'],
          validate: false,
        ),
        validator: map['validators'] == null
            ? null
            : Validator.fromDynamic({'validators': map['validators']}),
        value: map['value'],
      );
    }

    return result;
  }

  /// Removes any / all values this builder may have set from the
  /// [JsonWidgetRegistry].
  @override
  void remove(JsonWidgetData data) {
    if (data.id.isNotEmpty == true) {
      data.registry.removeValue(
        data.id,
        originator: data.id,
      );
    }

    super.remove(data);
  }

  /// Builds the widget to render to the tree.  If the [data] object has a
  /// non-empty `id` associated with it and the [enabled] property is [true]
  /// then this will attach the selected value to the [JsonWidgetRegistry]
  /// using the `id` as the key any time the selected value is changed.
  ///
  /// Likewise, this will set any error messages using the key '$id.error'.  An
  /// empty string will be used to represent no error message.
  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return _JsonDropdownButtonFormFieldWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
    );
  }
}

class _JsonDropdownButtonFormFieldWidget extends StatefulWidget {
  const _JsonDropdownButtonFormFieldWidget({
    required this.builder,
    this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonDropdownButtonFormFieldBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonDropdownButtonFormFieldWidgetState createState() =>
      _JsonDropdownButtonFormFieldWidgetState();
}

class _JsonDropdownButtonFormFieldWidgetState
    extends State<_JsonDropdownButtonFormFieldWidget> {
  dynamic _value;
  List<DropdownMenuItem>? _items;
  DropdownButtonBuilder? _selectedItemBuilder;
  InputDecoration? _decoration;

  @override
  void initState() {
    super.initState();
    _value = _getValue(widget.builder);
    _items = _getItems(widget.builder);
    _selectedItemBuilder = _getSelectedItemBuilder(widget.builder);
    _decoration = _getDecoration(widget.builder);
  }

  @override
  void didUpdateWidget(covariant _JsonDropdownButtonFormFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.builder.value != oldWidget.builder.value) {
      setState(() {
        _value = _getValue(widget.builder);
      });
    }
    if (widget.builder.items != oldWidget.builder.items) {
      setState(() {
        _items = _getItems(widget.builder);
        _selectedItemBuilder = _getSelectedItemBuilder(widget.builder);
      });
    }
    if (widget.builder.selectedItemBuilder !=
        oldWidget.builder.selectedItemBuilder) {
      setState(() {
        _selectedItemBuilder = _getSelectedItemBuilder(widget.builder);
      });
    }
    if (widget.builder.decoration != oldWidget.builder.decoration) {
      setState(() {
        _decoration = _getDecoration(widget.builder);
      });
    }
  }

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        alignment: widget.builder.alignment ?? AlignmentDirectional.centerStart,
        autofocus: widget.builder.autofocus ?? false,
        autovalidateMode: widget.builder.autovalidateMode,
        borderRadius: widget.builder.borderRadius,
        decoration: _decoration ?? const InputDecoration(),
        disabledHint: widget.builder.disabledHint?.build(
          childBuilder: widget.childBuilder,
          context: context,
        ),
        dropdownColor: widget.builder.dropdownColor,
        elevation: widget.builder.elevation ?? 8,
        enableFeedback: widget.builder.enableFeedback,
        focusColor: widget.builder.focusColor,
        focusNode: widget.builder.focusNode,
        hint: widget.builder.hint?.build(
          childBuilder: widget.childBuilder,
          context: context,
        ),
        icon: widget.builder.icon?.build(
          childBuilder: widget.childBuilder,
          context: context,
        ),
        items: _items,
        iconDisabledColor: widget.builder.iconDisabledColor,
        iconEnabledColor: widget.builder.iconEnabledColor,
        iconSize: widget.builder.iconSize ?? 24,
        isDense: widget.builder.isDense ?? true,
        isExpanded: widget.builder.isExpanded ?? false,
        itemHeight: widget.builder.itemHeight,
        menuMaxHeight: widget.builder.menuMaxHeight,
        onChanged: widget.builder.enabled != true
            ? null
            : (dynamic value) {
                if (widget.builder.onChanged != null) {
                  widget.builder.onChanged!(value);
                }
                _value = value;
                if (mounted == true) {
                  setState(() {});
                }

                if (widget.data.id.isNotEmpty == true) {
                  widget.data.registry.setValue(
                    widget.data.id,
                    value,
                    originator: widget.data.id,
                  );
                }
              },
        onSaved: widget.builder.onSaved,
        onTap: widget.builder.onTap,
        selectedItemBuilder: _selectedItemBuilder,
        validator: widget.builder.validator == null
            ? null
            : (dynamic value) {
                final error = widget.builder.validator!.validate(
                  label: _decoration?.labelText ?? '',
                  value: value?.toString(),
                );

                if (widget.data.id.isNotEmpty == true) {
                  widget.data.registry.setValue(
                    '${widget.data.id}.error',
                    error ?? '',
                    originator: widget.data.id,
                  );
                }

                return error;
              },
        style: widget.builder.style,
        value: _value,
      );

  InputDecoration? _getDecoration(JsonDropdownButtonFormFieldBuilder builder) {
    return widget.builder.decoration != null
        ? InputDecorationDecoder.fromDynamic(
            widget.builder.decoration,
            childBuilder: widget.childBuilder,
            context: context,
            registry: widget.data.registry,
          )
        : null;
  }

  dynamic _getValue(JsonDropdownButtonFormFieldBuilder builder) {
    return widget.builder.value;
  }

  List<DropdownMenuItem>? _getItems(
      JsonDropdownButtonFormFieldBuilder builder) {
    List<DropdownMenuItem>? items;
    if (builder.items != null) {
      items = [];
      if (widget.builder.items is List) {
        widget.builder.items.forEach((value) {
          items!.add(
            DropdownMenuItem(
              value: value,
              child: Text(value.toString()),
            ),
          );
        });
      } else {
        widget.builder.items.forEach((key, value) {
          items!.add(
            DropdownMenuItem(
              value: value,
              child: Text(key),
            ),
          );
        });
      }
    }
    return items;
  }

  DropdownButtonBuilder? _getSelectedItemBuilder(
      JsonDropdownButtonFormFieldBuilder builder) {
    DropdownButtonBuilder? selectedItemBuilder;

    final itemEntries = <String, dynamic>{};
    if (builder.items != null && widget.builder.items is List) {
      widget.builder.items.forEach((value) {
        itemEntries[value] = value;
      });
    } else if (builder.items != null) {
      widget.builder.items.forEach((key, value) {
        itemEntries[key] = value;
      });
    }

    if (widget.builder.selectedItemBuilder != null) {
      if (widget.builder.selectedItemBuilder is JsonWidgetData) {
        selectedItemBuilder = (BuildContext context) {
          final widgets = <Widget>[];
          itemEntries.forEach((key, value) {
            widget.data.registry.setValue(
              'dropdown_item_display',
              key,
              originator: null,
            );
            widget.data.registry.setValue(
              'dropdown_item_value',
              value,
              originator: null,
            );

            widget.builder.selectedItemBuilder.recreate().build(
                  childBuilder: widget.childBuilder,
                  context: context,
                );
          });

          return widgets;
        };
      } else {
        selectedItemBuilder = widget.builder.selectedItemBuilder;
      }
    }

    return selectedItemBuilder;
  }
}
