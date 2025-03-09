import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class ExportExamplePage extends StatefulWidget {
  const ExportExamplePage({super.key});

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
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () {
              final data = _exportKey.currentState!.export(
                indent: '  ',
                mode: ReverseEncodingMode.yaml,
              );
              Clipboard.setData(ClipboardData(text: data));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard')),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text('Exporter', style: TextStyle(color: Colors.white)),
      ),
      body: JsonWidgetExporter(
        key: _exportKey,
        child: JsonExportable(
          child: JsonScaffold(
            appBar: JsonAppBar(title: JsonText('Example')),
            body: JsonListView(
              children: [
                for (var i = 0; i < _count; i++)
                  JsonListTile(
                    subtitle: JsonText(
                      args: {'text': r'${i + 1}'},
                      registry: JsonWidgetRegistry(
                        parent: registry,
                        values: {'i': i},
                      ),
                      '${i + 1}',
                    ),
                    title: JsonText('ListTile'),
                  ),
              ],
            ),
            floatingActionButton: JsonFloatingActionButton(
              args: {'onPressed': r'${increment()}'},
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
