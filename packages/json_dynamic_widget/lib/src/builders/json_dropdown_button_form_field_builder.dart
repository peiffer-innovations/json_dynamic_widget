import 'dart:async';

import 'package:form_validation/form_validation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [DropdownButtonFormField] widget.  See the
/// [fromDynamic] for the format.
class JsonDropdownButtonFormFieldBuilder extends JsonWidgetBuilder {
  const JsonDropdownButtonFormFieldBuilder({
    required super.args,
  });

  /// Constructor to build the widget via code rather than JSON.  This is used
  /// to be able to encode widgets into JSON to help with the JSON generation.
  /// It can also be used to more easily debug widgets that are not working as
  /// expected.
  factory JsonDropdownButtonFormFieldBuilder.fromModel(
    JsonDropdownButtonFormFieldBuilderModel model,
  ) =>
      fromDynamic(model.toJson());

  static const kType = 'dropdown_button_form_field';

  static JsonDropdownButtonFormFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      JsonDropdownButtonFormFieldBuilder(
        args: map,
      );

  @override
  String get type => kType;

  @override
  JsonDropdownButtonFormFieldBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) =>
      JsonDropdownButtonFormFieldBuilderModel.fromDynamic(
        data.jsonWidgetArgs,
        registry: data.jsonWidgetRegistry,
      );

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

class JsonDropdownButtonFormFieldBuilderModel extends JsonWidgetBuilderModel {
  const JsonDropdownButtonFormFieldBuilderModel(
    super.args, {
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
  });

  static const kType = 'dropdown_button_form_field';

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
  static JsonDropdownButtonFormFieldBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(
      map,
      args: args,
      registry: registry,
    );

    if (result == null) {
      throw Exception(
        '[JsonDropdownButtonFormFieldBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

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
  /// If the [map] is `null` then `null` will be returned.
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [InputDecorationDecoder.fromDynamic]
  ///  * [JsonWidgetData.fromDynamic]
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  ///  * [ThemeDecoder.decodeColor]
  ///  * [ThemeDecoder.decodeTextStyle]
  ///  * [Validator]
  static JsonDropdownButtonFormFieldBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    JsonDropdownButtonFormFieldBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      registry ??= JsonWidgetRegistry.instance;
      map = registry.processArgs(map, <String>{}).value;

      result = JsonDropdownButtonFormFieldBuilderModel(
        args,
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
        disabledHint: JsonWidgetData.maybeFromDynamic(map['disabledHint']),
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
        hint: JsonWidgetData.maybeFromDynamic(map['hint']),
        icon: JsonWidgetData.maybeFromDynamic(map['icon']),
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

  @override
  Map<String, dynamic> toJson() => {
        'alignment': ThemeEncoder.encodeAlignment(alignment),
        'autofocus': autofocus,
        'autovalidateMode':
            ThemeEncoder.encodeAutovalidateMode(autovalidateMode),
        'borderRadius': ThemeEncoder.encodeBorderRadius(borderRadius),
        'decoration': decoration,
        'disabledHint': disabledHint,
        'dropdownColor': ThemeEncoder.encodeColor(dropdownColor),
        'elevation': elevation,
        'enableFeedback': enableFeedback,
        'enabled': enabled,
        'hint': hint?.toJson(),
        'icon': icon?.toJson(),
        'items': JsonClass.toJsonList(items),
        'iconDisabledColor': ThemeEncoder.encodeColor(iconDisabledColor),
        'iconEnabledColor': ThemeEncoder.encodeColor(iconEnabledColor),
        'iconSize': iconSize,
        'isDense': isDense,
        'isExpanded': isExpanded,
        'itemHeight': itemHeight,
        'menuMaxHeight': menuMaxHeight,
        'onChanged': onChanged,
        'onSaved': onSaved,
        'onTap': onTap,
        'selectedItemBuilder': selectedItemBuilder,
        'style': ThemeEncoder.encodeTextStyle(style),
        'validator': validator == null
            ? null
            : {
                'validators': validator!.toJson(),
              },
        'value': value,
        ...args,
      };
}

class DropdownButtonFormFieldSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget/dropdown_button_form_field.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    r'$children': 0,
    r'$comment':
        'https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html',
    'type': 'object',
    'title': 'DropdownButtonFormField',
    'additionalProperties': false,
    'properties': {
      'alignment': SchemaHelper.objectSchema(AlignmentSchema.id),
      'autofocus': SchemaHelper.boolSchema,
      'autovalidate': SchemaHelper.boolSchema,
      'autovalidateMode': SchemaHelper.objectSchema(AutovalidateModeSchema.id),
      'borderRadius': SchemaHelper.objectSchema(BorderRadiusSchema.id),
      'decoration': SchemaHelper.anySchema,
      'disabledHint': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'dropdownColor': SchemaHelper.objectSchema(ColorSchema.id),
      'elevation': SchemaHelper.numberSchema,
      'enableFeedback': SchemaHelper.boolSchema,
      'enabled': SchemaHelper.boolSchema,
      'focusColor': SchemaHelper.objectSchema(ColorSchema.id),
      'focusNode': SchemaHelper.stringSchema,
      'hint': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'icon': SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'items': SchemaHelper.anySchema,
      'iconDisabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconEnabledColor': SchemaHelper.objectSchema(ColorSchema.id),
      'iconSize': SchemaHelper.numberSchema,
      'isDense': SchemaHelper.boolSchema,
      'isExpanded': SchemaHelper.boolSchema,
      'itemHeight': SchemaHelper.numberSchema,
      'menuMaxHeight': SchemaHelper.boolSchema,
      'onChanged': SchemaHelper.stringSchema,
      'onSaved': SchemaHelper.stringSchema,
      'onTap': SchemaHelper.stringSchema,
      'selectedItemBuilder': SchemaHelper.anySchema,
      'shadows': SchemaHelper.arraySchema(ShadowSchema.id),
      'validators': SchemaHelper.anySchema,
      'style': SchemaHelper.objectSchema(TextStyleSchema.id),
      'value': SchemaHelper.anySchema,
    },
  };
}

class _JsonDropdownButtonFormFieldWidget extends StatefulWidget {
  const _JsonDropdownButtonFormFieldWidget({
    required this.builder,
    this.childBuilder,
    required this.data,
    super.key,
  });

  final JsonDropdownButtonFormFieldBuilder builder;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonDropdownButtonFormFieldWidgetState createState() =>
      _JsonDropdownButtonFormFieldWidgetState();
}

class _JsonDropdownButtonFormFieldWidgetState
    extends State<_JsonDropdownButtonFormFieldWidget> {
  InputDecoration? _decoration;
  List<DropdownMenuItem>? _items;
  late JsonDropdownButtonFormFieldBuilderModel _model;
  DropdownButtonBuilder? _selectedItemBuilder;
  late StreamSubscription _subscription;
  dynamic _value;

  @override
  void initState() {
    super.initState();

    _model = JsonDropdownButtonFormFieldBuilderModel.fromDynamic(
      widget.data.jsonWidgetArgs,
      registry: widget.data.jsonWidgetRegistry,
    );
    _items = _getItems();
    _selectedItemBuilder = _getSelectedItemBuilder();
    _decoration = _getDecoration();
    _value = _model.value;
    _subscription = widget.data.jsonWidgetRegistry.valueStream
        .where((e) => !e.isSelfTriggered && e.id == widget.data.jsonWidgetId)
        .listen((event) {
      _value = event.value;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant _JsonDropdownButtonFormFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model = JsonDropdownButtonFormFieldBuilderModel.fromDynamic(
      widget.data.jsonWidgetArgs,
    );
    _items = _getItems();
    _selectedItemBuilder = _getSelectedItemBuilder();
    _decoration = _getDecoration();
    _value = _model.value;
  }

  @override
  void dispose() {
    _subscription.cancel();
    if (widget.data.jsonWidgetId.isNotEmpty == true) {
      widget.data.jsonWidgetRegistry.removeValue(
        widget.data.jsonWidgetId,
        originator: widget.data.jsonWidgetId,
      );
    }
    super.dispose();
  }

  InputDecoration? _getDecoration() {
    return _model.decoration != null
        ? InputDecorationDecoder.fromDynamic(
            _model.decoration,
            childBuilder: widget.childBuilder,
            context: context,
            registry: widget.data.jsonWidgetRegistry,
          )
        : null;
  }

  List<DropdownMenuItem>? _getItems() {
    List<DropdownMenuItem>? items;
    if (_model.items != null) {
      items = [];
      if (_model.items is List) {
        _model.items.forEach((value) {
          items!.add(
            DropdownMenuItem(
              value: value,
              child: Text(value.toString()),
            ),
          );
        });
      } else {
        _model.items.forEach((key, value) {
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

  DropdownButtonBuilder? _getSelectedItemBuilder() {
    DropdownButtonBuilder? selectedItemBuilder;

    final itemEntries = <String, dynamic>{};
    if (_model.items is Iterable) {
      _model.items.forEach((value) {
        itemEntries[value] = value;
      });
    }

    if (_model.selectedItemBuilder != null) {
      if (_model.selectedItemBuilder is JsonWidgetData) {
        selectedItemBuilder = (BuildContext context) {
          final widgets = <Widget>[];
          itemEntries.forEach((key, value) {
            widget.data.jsonWidgetRegistry.setValue(
              'dropdown_item_display',
              key,
              originator: null,
            );
            widget.data.jsonWidgetRegistry.setValue(
              'dropdown_item_value',
              value,
              originator: null,
            );

            _model.selectedItemBuilder.build(
              childBuilder: widget.childBuilder,
              context: context,
              registry: widget.data.jsonWidgetRegistry,
            );
          });

          return widgets;
        };
      } else {
        selectedItemBuilder = _model.selectedItemBuilder;
      }
    }

    return selectedItemBuilder;
  }

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        alignment: _model.alignment ?? AlignmentDirectional.centerStart,
        autofocus: _model.autofocus ?? false,
        autovalidateMode: _model.autovalidateMode,
        borderRadius: _model.borderRadius,
        decoration: _decoration ?? const InputDecoration(),
        disabledHint: _model.disabledHint?.build(
          childBuilder: widget.childBuilder,
          context: context,
          registry: widget.data.jsonWidgetRegistry,
        ),
        dropdownColor: _model.dropdownColor,
        elevation: _model.elevation ?? 8,
        enableFeedback: _model.enableFeedback,
        focusColor: _model.focusColor,
        focusNode: _model.focusNode,
        hint: _model.hint?.build(
          childBuilder: widget.childBuilder,
          context: context,
          registry: widget.data.jsonWidgetRegistry,
        ),
        icon: _model.icon?.build(
          childBuilder: widget.childBuilder,
          context: context,
          registry: widget.data.jsonWidgetRegistry,
        ),
        items: _items,
        iconDisabledColor: _model.iconDisabledColor,
        iconEnabledColor: _model.iconEnabledColor,
        iconSize: _model.iconSize ?? 24,
        isDense: _model.isDense ?? true,
        isExpanded: _model.isExpanded ?? false,
        itemHeight: _model.itemHeight,
        menuMaxHeight: _model.menuMaxHeight,
        onChanged: _model.enabled != true
            ? null
            : (dynamic value) {
                if (_model.onChanged != null) {
                  _model.onChanged!(value);
                }
                _value = value;
                if (mounted == true) {
                  setState(() {});
                }

                if (widget.data.jsonWidgetId.isNotEmpty == true) {
                  widget.data.jsonWidgetRegistry.setValue(
                    widget.data.jsonWidgetId,
                    value,
                    originator: widget.data.jsonWidgetId,
                  );
                }
              },
        onSaved: _model.onSaved,
        onTap: _model.onTap,
        selectedItemBuilder: _selectedItemBuilder,
        validator: _model.validator == null
            ? null
            : (dynamic value) {
                final error = _model.validator!.validate(
                  label: _decoration?.labelText ?? '',
                  value: value?.toString(),
                );

                if (widget.data.jsonWidgetId.isNotEmpty == true) {
                  widget.data.jsonWidgetRegistry.setValue(
                    '${widget.data.jsonWidgetId}.error',
                    error ?? '',
                    originator: widget.data.jsonWidgetId,
                  );
                }

                return error;
              },
        style: _model.style,
        value: _value,
      );
}
