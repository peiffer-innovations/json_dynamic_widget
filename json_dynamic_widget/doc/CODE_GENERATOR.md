# Code Generator

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

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

### Simple Widget

A simplest widget requires very little code.  It basically requires the following:

1. An `@jsonWidget` annotation on the class.
1. A private class that extends `JsonWidgetBuilder`.  Typically named `_Json${WidgetName}Builder`, but that is not a requirement.
1. A constructor that takes a required named parameter to `super.args`.
1. A `buildCustom` function to inform the code generator what widget to to scan and generate the arguments for.


For example, here is a `SizedBox` which is the simplest case:

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_sized_box_builder.g.dart';

@jsonWidget /* #1 */
abstract class _JsonSizedBoxBuilder extends JsonWidgetBuilder { /* #2 */
  const _JsonSizedBoxBuilder({ /* #3 */
    required super.args,
  });

  @override
  SizedBox buildCustom({ /* #4 */
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
```

---

### Aliasing Properties

