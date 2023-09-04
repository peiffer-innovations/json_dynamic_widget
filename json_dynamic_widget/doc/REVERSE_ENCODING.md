# Reverse Encoding

<!-- START doctoc -->
<!-- END doctoc -->


**NOTE**: This documentation is still a work in progress!!!


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

---

## Advanced

TODO: Documents...