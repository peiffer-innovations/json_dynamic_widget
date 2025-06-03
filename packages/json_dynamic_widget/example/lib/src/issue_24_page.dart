import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class Issue24Page extends StatefulWidget {
  const Issue24Page({super.key});

  final url = 'assets/widgets/issue_24.json';

  @override
  State createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<Issue24Page> {
  @override
  Widget build(BuildContext context) {
    // implement build
    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          final registry = JsonWidgetRegistry.instance.copyWith();
          final widgetJson = jsonDecode(snapshot.data!);
          final widget = JsonWidgetData.fromDynamic(
            widgetJson,
            registry: registry,
          );
          return widget.build(context: context);
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
      future: _getWidget(),
    );
  }

  Future<String> _getWidget() async {
    final data = await rootBundle.loadString(widget.url);
    return data;
  }
}
