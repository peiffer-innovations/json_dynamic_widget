import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class Issue24Page extends StatefulWidget {
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
          var registry = JsonWidgetRegistry.instance.copyWith();
          var widgetJson = jsonDecode(snapshot.data!);
          var widget = JsonWidgetData.fromDynamic(
            widgetJson,
            registry: registry,
          )!;
          return widget.build(
            context: context,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: _getWidget(),
    );
  }

  Future<String> _getWidget() async {
    var data = await rootBundle.loadString(widget.url);
    return data;
  }
}
