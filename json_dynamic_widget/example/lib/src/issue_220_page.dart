import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// https://github.com/peiffer-innovations/json_dynamic_widget/issues/220
class Issue220Page extends StatefulWidget {
  const Issue220Page({
    super.key,
  });

  @override
  State createState() => _Issue220PageState();
}

class _Issue220PageState extends State<Issue220Page> {
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
          'Issue 220',
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
              title: JsonText('Issue 220'),
            ),
            body: JsonContainer(
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf7b928),
                    Color(0xFFd88515),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              foregroundDecoration: null,
            ),
          ),
        ),
      ),
    );
  }
}
