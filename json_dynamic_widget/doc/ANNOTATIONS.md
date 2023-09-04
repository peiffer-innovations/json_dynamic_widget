# Code Generation Annotations

<!-- START doctoc -->
<!-- END doctoc -->

---

**NOTE**: This documentation is still a work in progress!!!

## JsonArgAlias

**Target**: `method`

**Description**:

An annotation to be placed on the building `buildCustom` function that can alias a particular parameter.  A typical use case for this would be to maintain JSON compatibility if a parameter is renamed, or to standardize names across a family of widgets (like aliasing `slivers` to `children` on `SliverGrid`` for consistency).


---

## JsonArgDecoder

**Target**: `method`

**Description**:

An annotation to be placed on a function that can decode (parse) a particular widget parameter.  This can be used to perform custom processing, to provide custom defaults, or to simply decode values that have no built in decoders.

This requires the name (or alias) of the parameter from the Widget being built so the code generator knows to use this method and not try to use a default decoder.

The function that is annotated with this must be an instance function.


---

## JsonArgEncoder

**Target**: `method`

**Description**:

An annotation to be placed on a function that can encode a particular value into a JSON representation.

The function that is annotated with this must be static and it must return a value that is supported by [JsonEncoder].

---

## JsonArgSchema

**Target**: `method`

**Description**:

An annotation to be placed on a function that can provide the schema for a particular widget parameter.  This would typically be used in conjunction with the `JsonArgDecoder` to provide a schema for whatever the custom decoder supports.

The function that is annotated with this must be static and it must return a value that is supported by `JsonEncoder`.

---

## JsonBuildArg

**Target**: `parameter`

**Description**:

An annotation that informs the code generator that a particular widget parameter should be passed along from the building functions own parameter list rather that from the generated model.  This would typically only be attached to a `JsonWidgetData data` or `ChildWidgetBuilder childBuilder` parameter to let the widget being built have access to those build time values.

---

## JsonBuilder

**Target**: `method`

**Description**:

An annotation that to be attached to a method that is the method that defines the Widget being built.  The default methods the code generator looks for are first `buildCustom` and then `_buildCustom`.  This can be used to provde a non-default build method.

---

## JsonDefaultParam

**Target**: `method`

**Description**:

An annotation to be placed on a `buildCustom` function to specify the default value to apply to a widget's parameter.  This will override any default value the widget itself may have.

The function that is annotated with this must be static and it must return a `String`.

---

## JsonPositionedParam

**Target**: `method`

**Description**:

An annotation to be placed on the custom Widget building function to instruct the code generator to use a positional parameter when building the widget rather than a named parameter.

Two examples of needing this are `Icon` and `Text`.

---

## JsonSchemaName

**Target**: `method`

**Description**:

An annotation to be placed on the custom Widget building function to change the default name of the outputted Schema class.

---

## JsonWidget

**Target**: `chass`

**Description**:

An annotation to be placed on a class requesting the dynamic widget code generator to generate the dynamic code.

The `widget` can be used to name the widget that is being used in things like the schema.  This can be used to rename a private widget that wraps a standard widget so that it looks like the standard widget in the documentation and to any downstream tools.

The `autoRegister` can be set to `false` to skip adding the widget to the default registrar.

The `type` can override the widget JSON type that is generated for the widget.  By default the type is a snake_case'd version of the Widget.  For example, `ListView` becomes `list_view`.  However, there may be times where the default type may be undesireable.  `ClipRRrect` becoming `clip_r_rect` for instance.  In that case, `JsonWidget(type: 'clip_rrect')` could set the actual type to `clip_rrect`.

The `jsonWidget` defines the name of the generated reverse encodable widget if you would like to use a name that is different from the default.

---

## JsonWidgetRegistrar

**Target**: `chass`

**Description**:

An annotation to be placed on a class requesting the dynamic widget code generator to generate the registration code for the class.

---

## JsonWidgetRegistration

**Target**: `method`

**Description**:

An annotation to be placed on a method that registers a custom Widget within the class annotated by [JsonWidgetRegistrar].
