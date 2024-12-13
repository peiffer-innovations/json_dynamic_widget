# Reverse Encoding

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Introduction](#introduction)
- [Building an Encodable Widget Tree](#building-an-encodable-widget-tree)
- [Custom Encoding](#custom-encoding)
- [Providing dynamic args for encoding](#providing-dynamic-args-for-encoding)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

As of version 7.0.0, this package can perform reverse encoding where it can accept a widget tree and encode that into JSON to allow developers to try things out via Flutter's standard tools like hot reload and then be able to export the JSON or YAML for the widget tree.

Reverse encoding requires two widgets on the tree for it to work.  The parent is the `JsonWidgetExporter`.  This must be given a `GlobalKey` so you can access it's state and request the JSON data.  The second is the `JsonEncodable` widget that is a child of `JsonWidgetExporter`.  That widget announces itself to `JsonWidgetExporter` so that the framework can export the JSON / YAML out.

**Example**

```dart
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class ExportExamplePage extends StatefulWidget {
  const ExportExamplePage({
    super.key,
  });

  @override
  State createState() => _ExportExamplePageState();
}

class _ExportExamplePageState extends State<ExportExamplePage> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.setValue('count', _count);
    registry.setValue('increment', () => () => setState(() => _count++));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.copy,
              color: Colors.white,
            ),
            onPressed: () {
              final data = _exportKey.currentState!.export(
                indent: '  ',
                mode: ReverseEncodingMode.yaml,
              );
              Clipboard.setData(ClipboardData(text: data));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied to clipboard'),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text(
          'Exporter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: JsonWidgetExporter(
        key: _exportKey,
        child: JsonExportable(
          child: JsonScaffold(
            appBar: JsonAppBar(
              title: JsonText('Example'),
            ),
            body: JsonListView(
              children: [
                for (var i = 0; i < _count; i++)
                  JsonListTile(
                    subtitle: JsonText(
                      args: {
                        'text': r'${i + 1}',
                      },
                      registry: JsonWidgetRegistry(
                        parent: registry,
                        values: {
                          'i': i,
                        },
                      ),
                      '${i + 1}',
                    ),
                    title: JsonText('ListTile'),
                  ),
              ],
            ),
            floatingActionButton: JsonFloatingActionButton(
              args: {
                'onPressed': r'${increment()}',
              },
              registry: registry,
              onPressed: () => setState(() => _count++),
              child: JsonIcon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
```

**Example Output**
```yaml
type: scaffold
args: 
  appBar: 
    type: 'app_bar'
    args: 
      title: 
        type: text
        args: 
          text: Example

  body: 
    type: 'list_view'
    args: 
      children: 
        - type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: '${i + 1}'
            title: 
              type: text
              args: 
                text: ListTile

        - type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: '${i + 1}'
            title: 
              type: text
              args: 
                text: ListTile

        - type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: '${i + 1}'
            title: 
              type: text
              args: 
                text: ListTile

        - type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: '${i + 1}'
            title: 
              type: text
              args: 
                text: ListTile

        - type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: '${i + 1}'
            title: 
              type: text
              args: 
                text: ListTile


  floatingActionButton: 
    type: 'floating_action_button'
    args: 
      onPressed: '${increment()}'
      child: 
        type: icon
        args: 
          icon: 
            codePoint: 57415
            fontFamily: MaterialIcons
            matchTextDirection: false
```

---

## Building an Encodable Widget Tree

For every widget that can be built by this core library, there exists a `Json...` version of the widget that can be used to build an encodable tree.  A few examples:

* `AppBar` => `JsonAppBar`
* `Container` => `JsonContainer`
* `Scaffold` => `JsonScaffold`
* `Text` => `JsonText`
* ... etc



---

## Custom Encoding

To be able to provide your own encoding, utilize the [@JsonArgEncoder](./ANNOTATIONS.md#jsonargencoder) annotation.  Take the following example from the [dotted_border_builder.dart](../example/lib/src/dotted_border_builder.dart):

```dart
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
```

For the `DottedBorder`, when the widget is requested to be encoded, that function will be called and passed in the value used to build the `DottedBorder` widget to produce the final encoded JSON / YAML.

---

## Providing dynamic args for encoding

Every `Json` based Widget that can be used for encoding supports the ability to accept an `args` parameter.  Any value passed in `args` will be used in place of any named parameter of the same name.  This can allow for the encoder to provide fully capable results rather than having to return `${null}` for any unencodable value.

For example, to encode a proper button, take the following example:

```dart
void _increment() => setState(() => ++_count);

Widget build(BuildContext context) {
  final registry = JsonWidgetRegistry(
    values: {
      // Note that this isn't the _increment function directly, rather it is a
      // function that returns the _increment function due to how things work
      // with the registry vs being directly populated.
      'increment': () => _increment,
    },
  );

  return JsonElevatedButton(
    args: {
      // Here, we execute the increment function to populate it from the
      // registry to the dynamic widget.
      'onTap': r'${increment()}', 
    },
    // Make sure we pass in the registry we set the increment value on or else
    // it will fail to find that value and throw an exception.
    registry: registry, 
    // the args value overrides this.  You could also pass _increment if you
    // wanted to test things both with and without the registry and args.
    onTap: null, 
    child: JsonText('Increment'),
  );
}
```

When that is requested to be encoded, you will get back:

```yaml
type: elevated_button
args:
  onTap: '${increment()}'
  child:
    type: text
    args:
      text: Increment
```

Had we not passed in the `args` and simply passed in the `_increment` function to the `onTap` directly, the resulting encoded value would not have worked the same as it would not have been able to encode the `onTap` field and would have returned `${null}` as such:

```yaml
type: elevated_button
args:
  onTap: '${null}'
  child:
    type: text
    args:
      text: Increment
```

In many cases, that may be exactly what you are looking for as you can replace all the `${null}` values with what you need later.  It's just important to understand what the encoder can vs cannot encode, and also understand the process by which you can inform the encoder of dynamic values you would like to have encoded directly.