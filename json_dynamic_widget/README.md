# json_dynamic_widget

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Live Example](#live-example)
- [First Party Plugins](#first-party-plugins)
- [Migration to 7.X.X version](#migration-to-7xx-version)
  - [Code Generation](#code-generation)
    - [>= 7.0.0](#-700)
    - [< 7.0.0](#-700-1)
  - [Code Generation Annotations](#code-generation-annotations)
  - [Migration CLI](#migration-cli)
- [Usage](#usage)
- [Understanding the Registry](#understanding-the-registry)
- [Built In Widgets](#built-in-widgets)
  - [Passing the nulls to the args](#passing-the-nulls-to-the-args)
- [Using Expressions](#using-expressions)
  - [Using Variables](#using-variables)
  - [Dynamic Functions](#dynamic-functions)
    - [Basic function usage](#basic-function-usage)
    - [Named args in functions](#named-args-in-functions)
    - [Complex function calls](#complex-function-calls)
    - [Built functions](#built-functions)
- [Creating Custom Widgets](#creating-custom-widgets)
- [Creating Custom Arg Processor](#creating-custom-arg-processor)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Live Example

* [Web](https://peiffer-innovations.github.io/json_dynamic_widget/web/index.html#/)


## First Party Plugins

Here's a list of first party plugins that exist for this library.

* [json_dynamic_widget_plugin_components](https://pub.dev/packages/json_dynamic_widget_plugin_components)
* [json_dynamic_widget_plugin_font_awesome](https://pub.dev/packages/json_dynamic_widget_plugin_font_awesome)
* [json_dynamic_widget_plugin_ionicons](https://pub.dev/packages/json_dynamic_widget_plugin_ionicons)
* [json_dynamic_widget_plugin_js](https://pub.dev/packages/json_dynamic_widget_plugin_js)
* [json_dynamic_widget_plugin_lottie](https://pub.dev/packages/json_dynamic_widget_plugin_lottie)
* [json_dynamic_widget_plugin_material_icons](https://pub.dev/packages/json_dynamic_widget_plugin_material_icons)
* [json_dynamic_widget_plugin_markdown](https://pub.dev/packages/json_dynamic_widget_plugin_markdown)
* [json_dynamic_widget_plugin_rive](https://pub.dev/packages/json_dynamic_widget_plugin_rive)
* [json_dynamic_widget_plugin_svg](https://pub.dev/packages/json_dynamic_widget_plugin_svg)

## Migration to 7.X.X version

**NOTE**: There are [several breaking](CHANGELOG.md) changes in this release from the JSON Schema perspective.  Almost all of them can be automatically migrated from v6 to v7 using the [Migration CLI](#migration-cli).

---

### Code Generation

As of `7.0.0` a code generator exists to simplify the creation of the dynamic widgets.  The code generator can generate the Dart / Flutter code to build widgets or it can be used in reverse to generate the JSON / YAML from the Dart / Flutter code.  For more advanced information on the code generator, see the [Code Generator](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/doc/CODE_GENERATOR.md) document.  For more information on the JSON / YAML generator see [Reverse Encoding](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/doc/REVERSE_ENCODING.md).

The code that is now required to build a custom widget with the release of `7.0.0` is followed by the code that used to be required prior to `7.0.0`.

#### >= 7.0.0

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_column_builder.g.dart';

@jsonWidget
abstract class _JsonColumnBuilder extends JsonWidgetBuilder {
  const _JsonColumnBuilder({
    required super.args,
  });

  @override
  Column buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

#### < 7.0.0
```dart
import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_theme/json_theme_schemas.dart';

class JsonColumnBuilder extends JsonWidgetBuilder {
  const JsonColumnBuilder({
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    this.textBaseline,
    this.textDirection,
    required this.verticalDirection,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = -1;

  static const type = 'column';

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;

  static JsonColumnBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonColumnBuilder? result;

    if (map != null) {
      result = JsonColumnBuilder(
        crossAxisAlignment: ThemeDecoder.decodeCrossAxisAlignment(
              map['crossAxisAlignment'],
              validate: false,
            ) ??
            CrossAxisAlignment.center,
        mainAxisAlignment: ThemeDecoder.decodeMainAxisAlignment(
              map['mainAxisAlignment'],
              validate: false,
            ) ??
            MainAxisAlignment.start,
        mainAxisSize: ThemeDecoder.decodeMainAxisSize(
              map['mainAxisSize'],
              validate: false,
            ) ??
            MainAxisSize.max,
        textBaseline: ThemeDecoder.decodeTextBaseline(
          map['textBaseline'],
          validate: false,
        ),
        textDirection: ThemeDecoder.decodeTextDirection(
          map['textDirection'],
          validate: false,
        ),
        verticalDirection: ThemeDecoder.decodeVerticalDirection(
              map['verticalDirection'],
              validate: false,
            ) ??
            VerticalDirection.down,
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: [
        for (var child in data.children ?? <JsonWidgetData>[])
          child.build(
            context: context,
            childBuilder: childBuilder,
          ),
      ],
    );
  }
}

class ColumnSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas'
        '/schemas/json_dynamic_widget/column.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': id,
    r'$children': -1,
    r'$comment': 'https://api.flutter.dev/flutter/widgets/Column-class.html',
    'title': 'Column',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'object',
        'additionalProperties': false,
        'properties': {
          'crossAxisAlignment':
              SchemaHelper.objectSchema(CrossAxisAlignmentSchema.id),
          'mainAxisAlignment':
              SchemaHelper.objectSchema(MainAxisAlignmentSchema.id),
          'mainAxisSize': SchemaHelper.objectSchema(MainAxisSizeSchema.id),
          'textBaseline': SchemaHelper.objectSchema(TextBaselineSchema.id),
          'textDirection': SchemaHelper.objectSchema(TextDirectionSchema.id),
          'verticalDirection':
              SchemaHelper.objectSchema(VerticalDirectionSchema.id),
        },
      },
    ],
  };
}
```

---

### Code Generation Annotations

See the [Annotations](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/doc/ANNOTATIONS.md) guide for information on all of the code generation annotations available for use.

---

### Migration CLI

This version comes with a script that can migrate existing JSON / YAML files from v6 to v7 automatically.  To run the script, first add the package as a dependency:

```yaml
dependencies:
  json_dynamic_widget: <version>
```

Then run:
```shell
dart run json_dynamic_widget:migrate_7 [path/to/files]
```

The script will automatically migrate the files it finds and make a backup using the original name + `.bak`.  If you are satisfied with the output from the migration script, feel free to delete those backup files.  For more information, see the [Migration CLI](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/doc/MIGRATION_CLI.md) documentation

---

## Usage

**Important Note**: Because this library allows for dynamic building of Icons, Flutter's built in tree shaker for icons no longer has the ability to guarantee what icons are referenced vs not.  Once you include this as a dependency, you must add the `--no-tree-shake-icons` as a build flag or your builds will fail.

Example:
```
flutter build [apk | web | ios | ...] --no-tree-shake-icons
```

This library provides Widgets that are capable of building themselves from JSON or YAML structures.  The general structure follows:

```json
{
  "type": "<lower_case_type>",
  "id": "<optional-id>",
  "listen": [
    "var1",
    "var2",
    "..."
  ],
  "args": {
    "...": "..."
  },
}
```

```yaml
---
type: <lower_case_type>
id: <optional-id>
listen: 
  - var1
  - var2
  - ...
args:
  ...: ...

```

The `listen` array is used to define variable names that specified `JsonWidgetData` listen to. Thanks to that `JsonWidgetData` will be rebuilt with every change of such a variables.
In case of not defining such a array the `JsonWidgetRegistry` will try to built such a array dynamically and use any met variable. Good practice is to define it by a hand to reduce amount of rebuilds.

See the documentation and / or example app for the currently supported widgets.  All built types are encoded using a lower-case and underscore separator as opposed to a camel case strategy.  For instance, a `ClipRect` will have a type of `clip_rect`.

Once you have the JSON for a widget, you will use the `JsonWidgetData` to build the resulting Widget that can be added to the tree.  For performance reasons, the `JsonWidgetData` should be instantiated once and then cached rather than created in each `build` cycle.

**Example**
```dart
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    @required this.jsonData,
    this.registry,
    Key key,
  }): assert(jsonData != null),
    super(key: key)

  final Map<String, dynamic> jsonData;
  final JsonWidgetRegistry registry;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStatefulWidget> {
  @override
  void initState() {
    super.initState();

    _data = JsonWidgetData.fromDynamic(widget.jsonData);
  }

  @override
  Wiget build(BuildContext context) => _data.build(
    context, 
    registry: widget.registry ?? JsonWidgetRegistry.instance,
  );
}
```

## Understanding the Registry

The `JsonWidgetRegistry` is the centralized processing warehouse for building and using the JSON Dynamic Widgets.  Widgets must be registered to the registry to be available for building.  The registry also supports providing dynamic variables and dynamic functions to the widgets that it builds.
The Registry is also repsonsible for processing `JsonWidgetData` args to their 
real values via arg processors. Users can define their own arg processors which is giving the possibility to define the custom syntax.


When a value changes on the registry, it posts a notification to the [valueStream](https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/JsonWidgetRegistry/valueStream.html) so any potential processing logic can be executed.  The dynamic widgets that use variable values also listen to this stream so they can update their widget state when a value they use for rendering change.

The registry always has a default instance that will be used when a substitute registry is not given. Substitute registeries can be created and used to isolate variables and functions within the app as needed.  For instance, you may want a separate registry per page if each page may set dynamic values on the registry.  This can prevent the values from one page being overwritten by another.


## Built In Widgets

The structure for all the `args` is defined in each widget builder, which are defined below:

Widget Builders | Example Location
----------------|------------------
[align](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAlignBuilder-class.html) | [align.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/align.json)
[animated_align](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedAlignBuilder-class.html) | [animated_align.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_align.json)
[animated_container](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedContainerBuilder-class.html) | [animated_container.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_container.json)
[animated_cross_fade](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedCrossFadeBuilder-class.html) | [animated_cross_fade.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_cross_fade.json)
[animated_default_text_style](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedDefaultTextStyleBuilder-class.html) | [animated_default_text_style.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_default_text_style.json)
[animated_opacity](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedOpacityBuilder-class.html) | [animated_opacity.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_opacity.json)
[animated_padding](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedPaddingBuilder-class.html) | [animated_padding.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_padding.json)
[animated_physical_model](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedPhysicalModelBuilder-class.html) | [animated_physical_model.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_physical_model.json)
[animated_positioned](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedPositionedBuilder-class.html) | [animated_positioned.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_positioned.json)
[animated_positioned_directional](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedPositionedDirectionalBuilder-class.html) | [animated_positioned_directional.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_positioned_directional.json)
[animated_size](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedSizeBuilder-class.html) | [animated_size.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_size.json)
[animated_switcher](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedSwitcherBuilder-class.html) | [animated_switcher.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_switcher.json)
[animated_theme](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAnimatedThemeBuilder-class.html) | [animated_theme.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/animated_theme.json)
[app_bar](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAppBarBuilder-class.html) | [align.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/align.json)
[aspect_ratio](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAspectRatioBuilder-class.html) | [aspect_ratio.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/aspect_ratio.json)
[asset_image](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonAssetImageBuilder-class.html) | [asset_images.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/asset_images.json)
[baseline](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonBaselineBuilder-class.html) | [baseline.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/baseline.json)
[button_bar](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonButtonBarBuilder-class.html) | [card.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/card.json)
[card](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCardBuilder-class.html) | [card.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/card.json)
[center](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCenterBuilder-class.html) | [center.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/center.json)
[checkbox](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCheckboxBuilder-class.html) | [checkbox.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/checkbox.json)
[circular_progress_indicator](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCircularProgressIndicatorBuilder-class.html) | [circular_progress_indicator.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/circular_progress_indicator.json)
[clip_oval](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonClipOvalBuilder-class.html) | [clips.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/clips.json)
[clip_path](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonClipPathBuilder-class.html) | [clips.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/clips.json)
[clip_rect](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonClipRectBuilder-class.html) | [clips.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/clips.json)
[clip_rrect](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonClipRRectBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[column](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonColumnBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[comment](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCommentBuilder-class.html) | [scroll_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/scroll_view.json)
[conditional](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonConditionalBuilder-class.html) | [conditional.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/conditional.json)
[container](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonContainerBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[cupertino_switch](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCupertinoSwitchBuilder-class.html) | [cupertino_switch.yaml](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/cupertino_switch.yaml)
[custom_scroll_view](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonCustomScrollViewBuilder-class.html) | [slivers.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/slivers.json)
[directionality](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonDirectionalityBuilder-class.html) | [directionality.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/directionality.json)
[dropdown_button_form_field](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonDropdownButtonFormFieldBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[dynamic](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonDynamicBuilder-class.html) | [dynamic.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/dynamic.json)
[elevated_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonElevatedButtonBuilder-class.html) | [buttons.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/buttons.json)
[expanded](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonExpandedBuilder-class.html) | [conditional.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/conditional.json)
[fitted_box](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFittedBoxBuilder-class.html) | [fitted_box.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/fitted_box.json)
[flexible](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFlexibleBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[floating_action_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFloatingActionButtonBuilder-class.html) | [buttons.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/buttons.json)
[form](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFormBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[fractional_translation](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFractionalTranslationBuilder-class.html) | [fractional_translation.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/fractional_translation.json)
[fractionally_sized](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonFractionallySizedBoxBuilder-class.html) | [fractionally_sized.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/fractionally_sized_box.json)
[gesture_detector](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonGestureDetectorBuilder-class.html) | [gestures.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/gestures.json)
[grid_view](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonGridViewBuilder-class.html) | [for_each.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/for_each.json)
[hero](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonHeroBuilder-class.html) | [asset_images.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/asset_images.json)
[icon](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIconBuilder-class.html) | [card.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/card.json)
[icon_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIconButtonBuilder-class.html) | [buttons.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/buttons.json)
[ignore_pointer](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIgnorePointerBuilder-class.html) | [gestures.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/gestures.json)
[indexed_stack](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIndexedStackBuilder-class.html) | [indexed_stack.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/indexed_stack.json)
[ink_well](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonInkWellBuilder-class.html) | [asset_images.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/asset_images.json)
[input_error](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonInputErrorBuilder-class.html) | [input_error.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/input_error.json)
[interactive_viewer](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonInteractiveViewerBuilder-class.html) | [interactive_viewer.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/interactive_viewer.json)
[intrinsic_height](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIntrinsicHeightBuilder-class.html) | [intrinsic_height.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/intrinsic_height.json)
[intrinsic_width](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonIntrinsicWidthBuilder-class.html) | [intrinsic_width.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/intrinsic_width.json)
[limited_box](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonLimitedBoxBuilder-class.html) | [limited_box.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/limited_box.json)
[linear_progress_indicator](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonLinearProgressIndicatorBuilder-class.html) | [linear_progress_indicator.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/linear_progress_indicator.json)
[list_tile](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonListTileBuilder-class.html) | [card.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/card.json)
[list_view](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonListViewBuilder-class.html) | [list_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/list_view.json)
[material](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonMaterialBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[memory_image](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonMemoryImageBuilder-class.html) | [images.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/images.json)
[network_image](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonNetworkImageBuilder-class.html) | [images.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/images.json)
[offstage](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonOffstageBuilder-class.html) | [offstage.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/offstage.json)
[opacity](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonOpacityBuilder-class.html) | [opacity.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/opacity.json)
[outlined_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonOutlinedButtonBuilder-class.html) | [buttons.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/buttons.json)
[overflow_box](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonOverflowBoxBuilder-class.html) | [overflow_box.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/overflow_box.json)
[padding](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonPaddingBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[placeholder](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonPlaceholderBuilder-class.html) | [placeholder.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/placeholder.json)
[popup_menu_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonPopupMenuButtonBuilder-class.html) | [popup_menu_button.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/popup_menu_button.json)
[positioned](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonPositionedBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[primary_scroll_controller](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonPrimaryScrollControllerBuilder-class.html) | [scroll_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/scroll_view.json)
[radio](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonRadioBuilder-class.html) | [radio.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/radio.json)
[rich_text](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonRichTextBuilder-class.html) | [rich_text.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/rich_text.json)
[row](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonRowBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[safe_area](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSafeAreaBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[save_context](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSaveContextBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[scaffold](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonScaffoldBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[scroll_configuration_](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonScrollConfigurationBuilder-class.html) | [scroll_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/scroll_view.json)
[scrollbar](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonScrollbarBuilder-class.html) | [scroll_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/scroll_view.json)
[set_default_value](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSetDefaultValueBuilder-class.html) | [set_default_value.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/set_default_value.json)
[set_scroll_controller](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSetScrollControllerBuilder-class.html) | [scroll_view.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/scroll_view.json)
[set_value](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSetValueBuilder-class.html) | [set_default_value.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/set_default_value.json)
[single_child_scroll_view](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSingleChildScrollViewBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[sized_box](https://pub.dev/documentation/json_dynamic_widget/latest/json_dynamic_widget/JsonSizedBoxBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[sliver_grid](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSliverGridBuilder-class.html) | [slivers.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/slivers.json)
[sliver_padding](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSliverPaddingBuilder-class.html) | [slivers.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/slivers.json)
[sliver_list](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSliverListBuilder-class.html) | [slivers.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/slivers.json)
[sliver_to_box_adapter](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSliverToBoxAdapterBuilder-class.html) | [slivers.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/slivers.json)
[stack](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonStackBuilder-class.html) | [align.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/align.json)
[switch](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonSwitchBuilder-class.html) | [switch.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/switch.json)
[text](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonTextBuilder-class.html) | [bank_example.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/bank_example.json)
[text_button](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonTextButtonBuilder-class.html) | [buttons.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/buttons.json)
[text_form_field](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonTextFormFieldBuilder-class.html) | [form.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/form.json)
[theme](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonThemeBuilder-class.html) | [theme.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/theme.json)
[tooltip](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonTooltipBuilder-class.html) | [tooltip.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/tooltip.json)
[tween_animation](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonTweenAnimationBuilder-class.html) | [tween_animation.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/tween_animation.json)
[wrap](https://pub.dev/documentation/json_dynamic_widget/latest/builders/JsonWrapBuilder-class.html) | [wrap.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/json_dynamic_widget/example/assets/pages/wrap.json)

All the internal builders are added to the registry by default.

It is possible to omit that behavior by using `overrideInternalBuilders` flag.
To select manually the internal functions it is recommended to use `JsonWidgetInternalBuildersBuilder`.
const JsonWidgetBuilderContainer(
            builder: JsonBottomNavigationBarBuilder.fromDynamic,
            schemaId: BottomNavigationBarSchema.id
        )
```
  JsonWidgetRegistry(
    overrideInternalBuilders: true,
     builders: {
    ...JsonWidgetInternalBuildersBuilder().withColumn().build(),
    ...<String, JsonWidgetBuilderContainer>{
      JsonCustomBuilder.kType: JsonWidgetBuilderContainer(
          builder: JsonCustomBuilder.fromDynamic,
          schemaId: JsonCustomBuilderSchema.id)
    }
  });
```

### Passing the nulls to the args

All explicit nulls like `{"key" : null}` are removed from the `args` on parsing level.
<br>Sometimes `null` value and lack of value are two separate pieces of information and there is a need to pass it up to builder level.

A special syntax must be used to fulfill that need:

```
{
  "maxLines": "${null}"
}
```

Example:
[null_value_passing.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/example/assets/pages/null_value_passing.json)

---

## Using Expressions

The library since version 4.0.0 has a tight integration with [expressions](https://pub.dev/packages/expressions) library. By integrating the `JsonWidgetRegistry` variables and functions with that library there is possible to define different kind of simple expressions placed between `${}`.

---

### Using Variables

Variables can be defined on the `JsonWidgetRegistry` that is used to render the dynamic widgets.

A variable can be used in any of the `child` / `children` / `args` values and for certain types of properties, a variable reference is the only way to actually assign that value.

Widgets that accept user input will assign that user input to a variable named the value inside of the `id` option, if an `id` exists.  This allows widgets the ability to listen to input value updates.

There is a possibility to use them in JSON definition thanks to [expressions](https://pub.dev/packages/expressions) library. Few examples:
```
${dynamicVariable}
${dynamic['persons'][0]}
${'Hello ' + name}
```

More examples are available at [variables.json](https://github.com/peiffer-innovations/json_dynamic_widget/blob/main/example/assets/pages/variables.json).

The built in variables are defined below:

Variable Name        | Example | Description
---------------------|---------|------------
`${curveName}_curve` | <ul><li>`${linear_curve}`</li><li>`${bounce_in_curve}`</li></ul> | Provides a `const` instance of any of the [Curves](https://api.flutter.dev/flutter/animation/Curves-class.html#constants) const values. The name of the Curve constant should be transformed into snake_case.

---

### Dynamic Functions

#### Basic function usage
Like any other expression functions defined in `JsonWidgetRegistry` can be used in JSON by placing their name and params between `${}`. For example:
```
${sayHello('Hello,' + firstName)}
```

Assuming the function `sayHello` is implemented as, and the `firstName` variable is "Ted":
```dart
print(args[0]);
```
... then the output of that could would be:
```
Hello, Ted!
```

#### Named args in functions

Additionally we can pass a map to the function:
```
${myFunction({'key':'keyName', 'value':value})}
```

Now, in your function, the args will be passed as such:
```
[
  {"key":"keyName", "value": <<value of the variable from the registry>>}
]
```

This allows function that take multiple, optional, values to be more easily created and called vs having to do something like...
```
${myFunction(value, null, null, null, '#ff0000')}
```

#### Complex function calls
This is possible to construct really complex function calls:
```
${func1(func2(func3()+' text'+var1), func4(1+2))}
```

#### Built functions
The built in functions are defined below:

Function Name    | Example | Args | Description
-----------------|---------|------|------------
`dynamic`        | `${dynamic('operationVar1', 'operationVar2'...)}` | The variable names which contains values convertable into `DynamicOperation`.| Executes every `DynamicOperation` passed as args.
`for_each`       | `${for_each(items['data']['items'], 'templateName', 'value', 'key')}` | <ol><li>The variable containing the items to iterate over</li><li>The variable containing the template to use when iterating.</li><li>Optional: the name of the variable to put the value in</li><li>Optional: the name of the variable to put the index or key in</li></ol> | Iterates over the list or map defined by the first arg and builds the widget defined in the template / second argument.  The value will be placed in either the variable named `value` or the passed in third argument.  Finally, the index or key will be placed in `key` or the fourth arg's name.
`length`         | `${length(myVar)}` | <ol><li>The variable or value to return the length from.</li></ol> | Returns the length of the first argument.  If the argument is a JSON encoded String, this will first decode it to the native representation.  Next, the return value depends on the type of argument.  If the arg is a String, a Map, a List, a Set, or an Iterable, the result of calling `.length` on it will be returned.  Otherwise if the arg is an int or a double, the int value of the arg will be returned.  Other types will result in an exception.
`log`            | `${log('my message', 'info')}` | <ol><li>The message to write to the logger</li><li>Optional: level to log the message at; defaults to `finest`</li></ol> | Logs the given message out to the logger using the optional level or `finest` if not set.
`navigate_named` | `${navigate_named('home', someValue)}` | <ol><li>The route name</li><li>Optional: an arguments object to provide</li></ol> | Navigates to the named route.  The `GlobalKey<NavigatorState>` must be provided to the registry before this will work.
`navigate_pop`   | `${navigate_pop(false)}` | <ol><li>Optional: the value to pop with</li></ol> | Pop's the navigator stack.  The `GlobalKey<NavigatorState>` must be provided to the registry before this will work.
`noop`           | `${noop()}` | n/a | Simple no-arg no-op function that can be used to enable buttons for UI testing.
`remove_value`   | `${remove_value('varName')}` | <ol><li>The variable name</li></ol> | Removes the variable named in the first argument from the registry.
`set_value`      | `${set_value('varName', 'some value')}` | <ol><li>The variable name</li><li>The variable value</li></ol> | Sets the value of the variable in the registry.

All the internal functions are added to the registry by default.

It is possible to omit that behavior by using `overrideInternalFunctions` flag.
To select manually the internal functions it is recommended to use `JsonWidgetInternalFunctionsBuilder`.
```
  JsonWidgetRegistry(
    overrideInternalFunctions: true, 
    functions: {
      ...JsonWidgetInternalFunctionsBuilder().withSetValue().build(),
      ...<String, JsonWidgetFunction>{
        'customFunction': ({args, required registry}) {
          print("This is a custom registry function.");
        },
      }
  });
```

---

## Creating Custom Widgets

Creating a custom widget requires first creating a `JsonWidgetBuilder` for the widget you would like to add.

For example, if you would like to create a new widget that can render a SVG, you would create a `SvgBuilder` like the following:

```dart
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'svg_builder.g.dart';

@jsonWidget
abstract class _SvgBuilder extends JsonWidgetBuilder {
  const _SvgBuilder({
    required super.args,
  });

  @override
  _Svg buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Svg extends StatelessWidget {
  const _Svg({
    this.asset,
    this.color,
    this.height,
    this.url,
    this.width,
  })  : assert(asset == null || url == null),
        assert(asset != null || url != null);

  final String? asset;
  final Color? color;
  final double? height;
  final String? url;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return asset != null
        ? SvgPicture.asset(
            asset!,
            height: height,
            width: width,
          )
        : SvgPicture.network(
            url!,
            height: height,
            width: width,
          );
  }
}
```

Next, you will need to run the code generator command to generate the glue / binding code.  To run the code generator, execute:
```shell
dart run build_runner build --delete-conflicting-outputs
```

Once the code is generated, you can safely use the registry to build the widget from JSON.  For this example widget, the following JSON would construct an instance:

```json
{
  "type": "svg",
  "args": {
    "asset": "assets/images/visa.svg",
    "color": "#fff",
    "height": 40,
    "width": 56
  }
}
```

---

## Creating Custom Arg Processor
Custom arg processors are allowing to extend JSON syntax with custom one.

For example let's create the arg processor which will convert `"TRUE"` and `"FALSE"` into booleans as a result of `JsonWidgetRegistry` args processing.

First the `ArgProcessor` interface has to be implemented.

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class BooleanStringArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'^TRUE|FALSE$');

  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  @override
  ProcessedArg process(
      JsonWidgetRegistry registry, dynamic arg, Set<String>? listenVariables) {
    var resultListenVariables = listenVariables ?? <String>{};
    var boolStr = _matchRegexp.firstMatch(arg)!.toString();
    return ProcessedArg(
        listenVariables: resultListenVariables,
        value: boolStr == 'TRUE',
    );
  }
}
```

Then such a processor has to be placed into `JsonWidgetRegistry`.
By default `ArgProcessors.defaults` are used but there is a possibility to change that via
`JsonWidgetRegistry.registerArgProcessors`.

```dart
  var registry = JsonWidgetRegistry.instance;

  registry.registerArgProcessors(
   <ArgProcessor>[BooleanStringArgProcessor()].addAll(ArgProcessors.defaults)
  );
```

The arg processors are executed from the first to the last one in the list.
To make sure that `BooleanStringArgProcessor` will be used the best is to add it as a first element of the list.
