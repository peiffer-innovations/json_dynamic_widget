import 'dart:convert';

import 'package:meta/meta_meta.dart';

const jsonWidget = JsonWidget(
  autoRegister: true,
);
const jsonWidgetRegistrar = JsonWidgetRegistrar();

/// An annotation that to be attached to a method that is the method that
/// defines the Widget being built.  The default methods the code generator
/// looks for are first `buildCustom` and then `_buildCustom`.  This can be used
/// to provde a non-default build method.
@Target({TargetKind.method})
class JsonBuilder {
  const JsonBuilder();
}

/// An annotation that informs the code generator that a particular widget
/// parameter should be passed along from the building functions own parameter
/// list rather that from the generated model.  This would typically only be
/// attached to a `JsonWidgetData data` or `ChildWidgetBuilder childBuilder`
/// parameter to let the widget being built have access to those build time
/// values.
@Target({TargetKind.parameter})
class JsonBuildArg {
  const JsonBuildArg();
}

/// An annotation to be placed on the building `buildCustom` function that can
/// alias a particular parameter.  A typical use case for this would be to
/// maintain JSON compatibility if a parameter is renamed, or to standardize
/// names across a family of widgets (like aliasing `slivers` to `children` on
/// [SliverGrid] for consistency).
@Target({TargetKind.method})
class JsonArgAlias {
  const JsonArgAlias({
    required this.alias,
    required this.name,
  });

  final String alias;
  final String name;
}

/// An annotation to be placed on a function that can decode (parse) a
/// particular widget parameter.  This can be used to perform custom processing,
/// to provide custom defaults, or to simply decode values that have no built
/// in decoders.
///
/// This requires the name (or alias) of the parameter from the Widget being
/// built so the code generator knows to use this method and not try to use a
/// default decoder.
///
/// The function that is annotated with this must be an instance function.
@Target({TargetKind.method})
class JsonArgDecoder {
  const JsonArgDecoder(this.param);

  final String param;
}

/// An annotation to be placed on a `buildCustom` function to specify the
/// default value to apply to a widget's parameter.  This will override any
/// default value the widget itself may have.
///
/// The function that is annotated with this must be static and it must return a
/// [String].
@Target({TargetKind.method})
class JsonDefaultParam {
  const JsonDefaultParam(
    this.name,
    this.code,
  );

  final String code;
  final String name;
}

/// An annotation to be placed on a function that can encode a particular value
/// into a JSON representation.
///
/// The function that is annotated with this must be static and it must return a
/// value that is supported by [JsonEncoder].
@Target({TargetKind.method})
class JsonArgEncoder {
  const JsonArgEncoder(this.param);

  final String param;
}

/// An annotation to be placed on a function that can provide the schema for
/// a particular widget parameter.  This would typically be used in conjunction
/// with the [JsonArgDecoder] to provide a schema for whatever the custom
/// decoder supports.
///
/// The function that is annotated with this must be static and it must return a
/// value that is supported by [JsonEncoder].
@Target({TargetKind.method})
class JsonArgSchema {
  const JsonArgSchema(this.param);

  final String param;
}

/// An annotation to be placed on the custom Widget building function to
/// instruct the code generator to use a positional parameter when building the
/// widget rather than a named parameter.
///
/// Two examples of needing this are [Icon] and [Text].
@Target({TargetKind.method})
class JsonPositionedParam {
  const JsonPositionedParam(this.name);

  final String name;
}

/// An annotation to be placed on the custom Widget building function to change
/// the default name of the outputted Schema class.
@Target({TargetKind.method})
class JsonSchemaName {
  const JsonSchemaName(this.name);

  final String name;
}

/// An annotation to be placed on a class requesting the dynamic widget code
/// generator to generate the dynamic code.
///
/// The [autoRegister] can be set to `false` to skip adding the widget to the
/// default registrar.
///
/// The [type] can override the widget JSON type that is generated for the
/// widget.  By default the type is a snake_case'd version of the Widget.  For
/// example, `ListView` becomes `list_view`.  However, there may be times where
/// the default type may be undesireable.  `ClipRRrect` becoming `clip_r_rect`
/// for instance.  In that case, `JsonWidget(type: 'clip_rrect')` could set the
/// actual type to `clip_rrect`.
@Target({TargetKind.classType})
class JsonWidget {
  const JsonWidget({
    this.autoRegister = true,
    this.jsonWidget,
    this.type,
    this.widget,
  });

  final bool autoRegister;
  final String? jsonWidget;
  final String? type;
  final String? widget;
}

/// An annotation to be placed on a class requesting the dynamic widget code
/// generator to generate the registration code for the class.
@Target({TargetKind.classType})
class JsonWidgetRegistrar {
  const JsonWidgetRegistrar();
}

/// An annotation to be placed on a method that registers a custom Widget within
/// the class annotated by [JsonWidgetRegistrar].
@Target({TargetKind.method})
class JsonWidgetRegistration {
  const JsonWidgetRegistration({
    required this.builder,
    this.schema = '',
    required this.widget,
  });

  final String builder;
  final String schema;
  final String widget;
}
