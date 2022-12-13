import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class InputDecorationDecoder {
  static InputDecoration? fromDynamic(
    dynamic map, {
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetRegistry? registry,
  }) {
    InputDecoration? result;

    if (map != null) {
      result = InputDecoration(
          alignLabelWithHint: JsonClass.parseBool(map['alignLabelWithHint']),
          border: ThemeDecoder.decodeInputBorder(
            map['border'],
            validate: false,
          ),
          contentPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
            map['contentPadding'],
            validate: false,
          ),
          counter: JsonWidgetData.fromDynamic(
            map['counter'],
            registry: registry,
          )?.build(childBuilder: childBuilder, context: context),
          counterStyle: ThemeDecoder.decodeTextStyle(
            map['counterStyle'],
            validate: false,
          ),
          counterText: map['counterText'],
          disabledBorder: ThemeDecoder.decodeInputBorder(
            map['disabledBorder'],
            validate: false,
          ),
          enabled: map['enabled'] == null
              ? true
              : JsonClass.parseBool(map['enabled']),
          enabledBorder: ThemeDecoder.decodeInputBorder(
            map['enabledBorder'],
            validate: false,
          ),
          errorBorder: ThemeDecoder.decodeInputBorder(
            map['errorBorder'],
            validate: false,
          ),
          errorMaxLines: JsonClass.parseInt(map['errorMaxLines']),
          errorStyle: ThemeDecoder.decodeTextStyle(
            map['errorStyle'],
            validate: false,
          ),
          errorText: map['errorText'],
          fillColor: ThemeDecoder.decodeColor(
            map['fillColor'],
            validate: false,
          ),
          filled:
              map['filled'] == null ? null : JsonClass.parseBool(map['filled']),
          floatingLabelBehavior: ThemeDecoder.decodeFloatingLabelBehavior(
            map['floatingLabelBehavior'],
            validate: false,
          ),
          focusColor: ThemeDecoder.decodeColor(
            map['focusColor'],
            validate: false,
          ),
          focusedBorder: ThemeDecoder.decodeInputBorder(
            map['focusedBorder'],
            validate: false,
          ),
          focusedErrorBorder: ThemeDecoder.decodeInputBorder(
            map['focusedErrorBorder'],
            validate: false,
          ),
          helperMaxLines: JsonClass.parseInt(map['helperMaxLines']),
          helperStyle: ThemeDecoder.decodeTextStyle(
            map['helperStyle'],
            validate: false,
          ),
          helperText: map['helperText'],
          hintMaxLines: JsonClass.parseInt(map['hintMaxLines']),
          hintStyle: ThemeDecoder.decodeTextStyle(
            map['hintStyle'],
            validate: false,
          ),
          hintText: map['hintText'],
          hoverColor: ThemeDecoder.decodeColor(
            map['hoverColor'],
            validate: false,
          ),
          icon: JsonWidgetData.fromDynamic(
            map['icon'],
            registry: registry,
          )?.build(
            childBuilder: childBuilder,
            context: context,
          ),
          isDense: map['isDence'] == null
              ? null
              : JsonClass.parseBool(map['isDense']),
          labelStyle: ThemeDecoder.decodeTextStyle(
            map['labelStyle'],
            validate: false,
          ),
          labelText: map['labelText'],
          prefix: JsonWidgetData.fromDynamic(
            map['prefix'],
            registry: registry,
          )?.build(
            childBuilder: childBuilder,
            context: context,
          ),
          prefixIcon: JsonWidgetData.fromDynamic(
            map['prefixIcon'],
            registry: registry,
          )?.build(
            childBuilder: childBuilder,
            context: context,
          ),
          prefixIconConstraints: ThemeDecoder.decodeBoxConstraints(
            map['prefixIconConstraints'],
            validate: false,
          ),
          prefixStyle: ThemeDecoder.decodeTextStyle(
            map['prefixStyle'],
            validate: false,
          ),
          prefixText: map['prefixText'],
          semanticCounterText: map['semanticCounterText'],
          suffix: JsonWidgetData.fromDynamic(
            map['suffix'],
            registry: registry,
          )?.build(
            childBuilder: childBuilder,
            context: context,
          ),
          suffixIcon: JsonWidgetData.fromDynamic(
            map['suffixIcon'],
            registry: registry,
          )?.build(
            childBuilder: childBuilder,
            context: context,
          ),
          suffixIconConstraints: ThemeDecoder.decodeBoxConstraints(
            map['suffixIconConstraints'],
            validate: false,
          ),
          suffixStyle: ThemeDecoder.decodeTextStyle(
            map['suffixStyle'],
            validate: false,
          ),
          suffixText: map['suffixText']);
    }

    return result;
  }
}
