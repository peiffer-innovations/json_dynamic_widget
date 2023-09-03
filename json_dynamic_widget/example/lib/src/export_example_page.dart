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
}
