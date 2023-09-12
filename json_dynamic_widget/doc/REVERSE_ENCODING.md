# Reverse Encoding

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Introduction](#introduction)
- [Building an Encodable Widget Tree](#building-an-encodable-widget-tree)
- [Custom Encoding](#custom-encoding)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

As of version 7.0.0, this package can perform reverse encoding where it can accept a widget tree and encode that into JSON to allow developers to try things out via Flutter's standard tools like hot reload and then be able to export the JSON or YAML for the widget tree.

Reverse encoding requires two widgets on the tree for it to work.  The parent is the `JsonWidgetExporter`.  This must be given a `GlobalKey` so you can access it's state and request the JSON data.  The second is the `JsonEncodable` widget that is a child of `JsonWidgetExporter`.  That widget announces itself to `JsonWidgetExporter` so that the framework can export the JSON / YAML out.

**Example**

```dart
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
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
                mode: JsonWidgetExporter.kYaml,
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
              title: JsonText(data: 'Example'),
            ),
            body: JsonListView(
              children: [
                for (var i = 0; i < _count; i++)
                  JsonListTile(
                    subtitle: JsonText(data: '${i + 1}'),
                    title: JsonText(data: 'ListTile'),
                  ),
              ],
            ),
            floatingActionButton: JsonFloatingActionButton(
              onPressed: () => setState(() => _count++),
              child: JsonIcon(icon: Icons.add),
            ),
          ),
        ),
      ),
    );
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
        - 
          type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: 1
            title: 
              type: text
              args: 
                text: ListTile

        - 
          type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: 2
            title: 
              type: text
              args: 
                text: ListTile

        - 
          type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: 3
            title: 
              type: text
              args: 
                text: ListTile

        - 
          type: 'list_tile'
          args: 
            subtitle: 
              type: text
              args: 
                text: 4
            title: 
              type: text
              args: 
                text: ListTile


  floatingActionButton: 
    type: 'floating_action_button'
    args: 
      onPressed: '${null}'
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
