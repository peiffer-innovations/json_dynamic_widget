# Code Generator

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Adding the Required Dependencies](#adding-the-required-dependencies)
- [Building a Custom Widget](#building-a-custom-widget)
  - [Simple Widget](#simple-widget)
  - [Aliasing Properties](#aliasing-properties)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Adding the Required Dependencies

To use the code generator on your own custom widgets, you must add the `build_runner` and `json_dynamic_widget_codegen` to your `dev_dependencies`.

```yaml
dev_dependencies:
  build_runner: <latest>
  json_dynamic_widget_codegen: <latest>
```

---

## Building a Custom Widget

While this covers the majority of the potential use cases, be sure to see the full documentation on the [Annotations](./ANNOTATIONS.md) as well as the built in [builders](../lib/src/builders/) for a full accounting of what the framework can do.


### Simple Widget

A simplest widget requires very little code.  It basically requires the following:

1. A `part` definition to inform Dart that the file is split between manually written code and the generated code.
1. An `@jsonWidget` annotation on the class.
1. A private class that extends `JsonWidgetBuilder`.  Typically named `_Json${WidgetName}Builder`, but that is not a requirement.
1. A constructor that takes a required named parameter to `super.args`.
1. A `buildCustom` function to inform the code generator what widget to to scan and generate the arguments for.


For example, here is a `SizedBox` which is the simplest case:

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sized_box_builder.g.dart'; /* #1 */

@jsonWidget /* #2 */
abstract class _JsonSizedBoxBuilder extends JsonWidgetBuilder { /* #3 */
  const _JsonSizedBoxBuilder({ /* #4 */
    required super.args,
  });

  @override
  SizedBox buildCustom({ /* #5 */
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

### Aliasing Parameters

Sometimes a widget may have a parameter that doesn't line up nicely with other widgets and that can create some confusion.  When this case is encountered, the framework provides a `JsonArgAlias`.  For example, the `SliverPadding` uses `sliver` rather than `child`, but that feels an unnecessary implementation detail to expose via the JSON structure.  To rename `sliver` to `child`, simply put an annotation on the `buildCustom` function as follows:

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sliver_padding_builder.g.dart';

@jsonWidget
abstract class _JsonSliverPaddingBuilder extends JsonWidgetBuilder {
  const _JsonSliverPaddingBuilder({
    required super.args,
  });

  @JsonArgAlias(alias: 'child', name: 'sliver')
  @override
  SliverPadding buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

### Custom Codecs

Not every type that widgets may need can be auto encoded or auto decoded.  When those types are encountered, you may need to provide your own encoder / decoder.  These can be performed via the `@JsonArgEncoder` and `@JsonArgDecoder`.

The `@JsonArgEncoder` must be a static function that takes only a single parameter of the type to encode.

The `@JsonArgDecoder` must be an instance function, and may take the following named parameters:
* **Required**: `dynamic value`
* `BuildContext context`
* `JsonWidgetData data`
* `ChildWidgetBuilder childBuilder`
* `${ModelName} model`
* `JsonWidgetRegistry registry`

Only the `dynamic value` is required.  The rest will be passed if the function defines them and they will not be passed if not.

```dart
import 'package:dotted_border/dotted_border.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'dotted_border_builder.g.dart';

@jsonWidget
abstract class _DottedBorderBuilder extends JsonWidgetBuilder {
  const _DottedBorderBuilder({
    required super.args,
  });

  @JsonArgEncoder('borderType')
  static String _encodeBorderType(BorderType value) {
    var result = 'circle';

    switch (value) {
      case BorderType.Circle:
        result = 'circle';
        break;
      case BorderType.Oval:
        result = 'oval';
        break;
      case BorderType.Rect:
        result = 'rect';
        break;
      case BorderType.RRect:
        result = 'rrect';
        break;
    }

    return result;
  }

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

  @JsonArgDecoder('borderType')
  BorderType _decodeBorderType({
    required value,
  }) {
    var result = BorderType.Circle;

    if (value is String) {
      switch (value) {
        case 'circle':
          result = BorderType.Circle;
          break;

        case 'oval':
          result = BorderType.Oval;
          break;

        case 'rect':
          result = BorderType.Rect;
          break;

        case 'rrect':
          result = BorderType.RRect;
          break;
      }
    }

    return result;
  }

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

  @override
  DottedBorder buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

### Positioned Widget Parameters

A few widgets like `Icon` and `Text` accept positioned parameters rather than named parameters.  When that situation is encountered, a name must be given to the positioned parameter.  To do so, annotate the `buildCustom` function with `@JsonPositionedParam` and give that annotation the name used within the widget.

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_builder.g.dart';

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

### Changing the Widget Type

The widget type generator converts a widget name from camel case to snake case but that can produce some unfortunate results for widgets with double capital letters in sequence.  One such example is the `ClipRRect` widget where most would expect the generated type to be `clip_rrect`, the actual generated type would be `clip_r_rect`.

To overred the default generated name

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_clip_rrect_builder.g.dart';

@JsonWidget(type: 'clip_rrect')
abstract class _JsonClipRRectBuilder extends JsonWidgetBuilder {
  const _JsonClipRRectBuilder({
    required super.args,
  });

  @override
  ClipRRect buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

### Fully Custom Widget

When you need to create a fully custom widget, the typical way is to include the widget as a private class within the builder.  If you need access to the `childBuilder`, the `model`, or the `data` then annotate those fields in the constructor with `@JsonBuildArg` to inform the builder that they are passthru's rather than parameters that are expected to be decoded.

```dart
import 'dart:async';

import 'package:json_conditional/json_conditional.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_conditional_builder.g.dart';

/// Builder that builds either the actual child widget or clears the child
/// widgets based on the result from the [conditional].
@jsonWidget
abstract class _JsonConditionalBuilder extends JsonWidgetBuilder {
  const _JsonConditionalBuilder({
    required super.args,
  });

  @JsonArgDecoder('conditional')
  Conditional _decodeConditiona({required dynamic value}) =>
      Conditional.fromDynamic(value);

  @override
  _Conditional buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

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

  final ChildWidgetBuilder? childBuilder;
  final Conditional conditional;
  final JsonWidgetData data;
  final JsonConditionalBuilderModel model;
  final JsonWidgetData? onFalse;
  final JsonWidgetData? onTrue;

  @override
  State createState() => _ConditionalState();
}

class _ConditionalState extends State<_Conditional> {
  final Set<String> _keys = <String>{};

  late Conditional _conditional;
  late JsonWidgetData _data;
  StreamSubscription<WidgetValueChanged>? _subscription;

  static void _appendKeys(
    Conditional conditional,
    Set<String> keys,
  ) {
    conditional.values?.forEach((key, _) => keys.add(key));
    conditional.conditions?.forEach(
      (conditional) => _appendKeys(conditional, keys),
    );
  }

  @override
  void initState() {
    super.initState();

    _conditional = widget.conditional;
    _appendKeys(widget.conditional, _keys);
    _data = widget.data;
    _subscription = widget.data.jsonWidgetRegistry.valueStream.listen(
      _handleSubscription,
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;

    super.dispose();
  }

  void _handleSubscription(WidgetValueChanged event) {
    if (_keys.contains(event.id) == true) {
      _conditional = Conditional.fromDynamic(widget.model.conditional);

      if (mounted == true) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = _conditional.evaluate(_data.jsonWidgetRegistry.values);

    final data = result ? widget.onTrue : widget.onFalse;

    Widget? child;
    if (data != null) {
      child = data.build(
        context: context,
        childBuilder: widget.childBuilder,
        registry: data.jsonWidgetRegistry,
      );
    }

    return child ?? const SizedBox();
  }
}
```