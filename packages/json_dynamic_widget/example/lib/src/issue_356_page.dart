import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// https://github.com/peiffer-innovations/json_dynamic_widget/issues/356
class Issue356Page extends StatelessWidget {
  Issue356Page({super.key});

  final JsonWidgetData data = JsonWidgetData.fromDynamic({
    'type': 'text',
    'args': {'text': 'Hello, World!'},
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue 356')),
      body: Center(child: data.build(context: context)),
    );
  }
}
