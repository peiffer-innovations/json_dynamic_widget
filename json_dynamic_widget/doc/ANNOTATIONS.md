# Code Generation Annotations

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [JsonArgAlias](#jsonargalias)
- [JsonArgDecoder](#jsonargdecoder)
- [JsonArgEncoder](#jsonargencoder)
- [JsonArgSchema](#jsonargschema)
- [JsonBuildArg](#jsonbuildarg)
- [JsonBuilder](#jsonbuilder)
- [JsonDefaultParam](#jsondefaultparam)
- [JsonPositionedParam](#jsonpositionedparam)
- [JsonSchemaName](#jsonschemaname)
- [JsonWidget](#jsonwidget)
- [JsonWidgetRegistrar](#jsonwidgetregistrar)
- [JsonWidgetRegistration](#jsonwidgetregistration)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

**NOTE**: This documentation is still a work in progress!!!

## JsonArgAlias

**Target**: `method`

**Description**:

An annotation to be placed on the building `buildCustom` function that can alias a particular parameter.  A typical use case for this would be to maintain JSON compatibility if a parameter is renamed, or to standardize names across a family of widgets (like aliasing `slivers` to `children` on `SliverGrid`` for consistency).

**Example**:
```dart
@JsonArgAlias(alias: 'children', name: 'slivers')
@override
CustomScrollView buildCustom({
  ChildWidgetBuilder? childBuilder,
  required BuildContext context,
  required JsonWidgetData data,
  Key? key,
});
```

---

## JsonArgDecoder

**Target**: `method`

**Description**:

An annotation to be placed on a function that can decode (parse) a particular widget parameter.  This can be used to perform custom processing, to provide custom defaults, or to simply decode values that have no built in decoders.

This requires the name (or alias) of the parameter from the Widget being built so the code generator knows to use this method and not try to use a default decoder.

The function that is annotated with this must be an instance function.

**Example**:
```dart
@JsonArgDecoder('strokeCap')
StrokeCap _decodeStrokeCap({
  required value,
}) {
  var result = StrokeCap.butt;

  if (value is String) {
    switch (value) {
      case 'butt':
        result = StrokeCap.butt;
        break;

      case 'round':
        result = StrokeCap.round;
        break;

      case 'square':
        result = StrokeCap.square;
        break;
    }
  }

  return result;
}
```

---

## JsonArgEncoder

**Target**: `method`

**Description**:

An annotation to be placed on a function that can encode a particular value into a JSON representation.

The function that is annotated with this must be static and it must return a value that is supported by [JsonEncoder].

**Example**:
```dart
@JsonArgEncoder('strokeCap')
static String _encodeStrokeCap(StrokeCap value) {
  var result = 'butt';

  switch (value) {
    case StrokeCap.butt:
      result = 'butt';
      break;

    case StrokeCap.round:
      result = 'round';
      break;

    case StrokeCap.square:
      result = 'square';
      break;
  }

  return result;
}
```

---

## JsonArgSchema

**Target**: `method`

**Description**:

An annotation to be placed on a function that can provide the schema for a particular widget parameter.  This would typically be used in conjunction with the `JsonArgDecoder` to provide a schema for whatever the custom decoder supports.

The function that is annotated with this must be static and it must return a value that is supported by `JsonEncoder`.

**Example**:
```dart
@JsonArgSchema('sortKey')
static Map<String, dynamic> _inputDecorationSchema() {
  final schema = OrdinalSortKeySchema.schema;
  SchemaCache().addSchema(OrdinalSortKeySchema.id, schema);
  return SchemaHelper.objectSchema(OrdinalSortKeySchema.id);
}
```

---

## JsonBuildArg

**Target**: `parameter`

**Description**:

An annotation that informs the code generator that a particular widget parameter should be passed along from the building functions own parameter list rather that from the generated model.  This would typically only be attached to a `JsonWidgetData data` or `ChildWidgetBuilder childBuilder` parameter to let the widget being built have access to those build time values.

**Example**:
```dart
class _Conditional extends StatefulWidget {
  const _Conditional({
    @JsonBuildArg() this.childBuilder,
    required this.conditional,
    @JsonBuildArg() required this.data,
    @JsonBuildArg() required this.model,
    Key? key,
    this.onFalse,
    this.onTrue,
  }) : super(key: key);
```

---

## JsonBuilder

**Target**: `method`

**Description**:

An annotation that to be attached to a method that is the method that defines the Widget being built.  The default methods the code generator looks for are first `buildCustom` and then `_buildCustom`.  This can be used to provde a non-default build method.

**Example**:
```dart
@JsonBuilder
_MyWidget _buildMyWidget({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
```

---

## JsonDefaultParam

**Target**: `method`

**Description**:

An annotation to be placed on a `buildCustom` function to specify the default value to apply to a widget's parameter.  This will override any default value the widget itself may have.

The function that is annotated with this must be static and it must return a `String`.

**Example**:
```dart
@JsonDefaultParam(
  'strokeAlign',
  'CircularProgressIndicator.strokeAlignCenter',
)
@JsonDefaultParam('valueColor', 'null')
@override
CircularProgressIndicator buildCustom({
  ChildWidgetBuilder? childBuilder,
  required BuildContext context,
  required JsonWidgetData data,
  Key? key,
});
```

---

## JsonPositionedParam

**Target**: `method`

**Description**:

An annotation to be placed on the custom Widget building function to instruct the code generator to use a positional parameter when building the widget rather than a named parameter.

Two examples of needing this are `Icon` and `Text`.

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_builder.g.dart';

/// Builder that can build an [Text] widget.
@jsonWidget
abstract class _JsonTextBuilder extends JsonWidgetBuilder {
  const _JsonTextBuilder({
    required super.args,
  });

  @JsonArgDecoder('text')
  String _decodeText({required dynamic value}) => value?.toString() ?? '';

  @JsonPositionedParam('data')
  @JsonArgAlias(alias: 'text', name: 'data')
  @override
  Text buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

## JsonSchemaName

**Target**: `method`

**Description**:

An annotation to be placed on the custom Widget building function to change the default name of the outputted Schema class.

**Example**:
```dart
@jsonWidget
abstract class _JsonIconBuilder extends JsonWidgetBuilder {
  const _JsonIconBuilder({
    required super.args,
  });

  @override
  @JsonPositionedParam('icon')
  @JsonSchemaName('WrappedIconSchema')
  Icon buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

## JsonWidget

**Target**: `class`

**Description**:

An annotation to be placed on a class requesting the dynamic widget code generator to generate the dynamic code.

The `widget` can be used to name the widget that is being used in things like the schema.  This can be used to rename a private widget that wraps a standard widget so that it looks like the standard widget in the documentation and to any downstream tools.

The `autoRegister` can be set to `false` to skip adding the widget to the default registrar.

The `type` can override the widget JSON type that is generated for the widget.  By default the type is a snake_case'd version of the Widget.  For example, `ListView` becomes `list_view`.  However, there may be times where the default type may be undesireable.  `ClipRRrect` becoming `clip_r_rect` for instance.  In that case, `JsonWidget(type: 'clip_rrect')` could set the actual type to `clip_rrect`.

The `jsonWidget` defines the name of the generated reverse encodable widget if you would like to use a name that is different from the default.

**Example**:
```dart
@jsonWidget
abstract class _JsonIconBuilder extends JsonWidgetBuilder {
  const _JsonIconBuilder({
    required super.args,
  });

  @override
  @JsonPositionedParam('icon')
  @JsonSchemaName('WrappedIconSchema')
  Icon buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

```
---

## JsonWidgetRegistrar

**Target**: `class`

**Description**:

An annotation to be placed on a class requesting the dynamic widget code generator to generate the registration code for the class.

**Example**:
```dart
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'default_registrar.g.dart';

@jsonWidgetRegistrar
abstract class _DefaultRegistrar {
  @JsonWidgetRegistration(
    builder: 'JsonDropdownButtonFormFieldBuilder',
    schema: 'DropdownButtonFormFieldSchema',
    widget: 'DropdownButtonFormField',
  )
  void withDropdownButtonFormField();

  @JsonWidgetRegistration(
    builder: 'JsonDynamicBuilder',
    schema: 'DynamicSchema',
    widget: 'Dynamic',
  )
  void withDynamic();
}
```

---

## JsonWidgetRegistration

**Target**: `method`

**Description**:

An annotation to be placed on a method that registers a custom Widget within the class annotated by [JsonWidgetRegistrar].

**Example**:
```dart
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'default_registrar.g.dart';

@jsonWidgetRegistrar
abstract class _DefaultRegistrar {
  @JsonWidgetRegistration(
    builder: 'JsonDropdownButtonFormFieldBuilder',
    schema: 'DropdownButtonFormFieldSchema',
    widget: 'DropdownButtonFormField',
  )
  void withDropdownButtonFormField();

  @JsonWidgetRegistration(
    builder: 'JsonDynamicBuilder',
    schema: 'DynamicSchema',
    widget: 'Dynamic',
  )
  void withDynamic();
}
```
