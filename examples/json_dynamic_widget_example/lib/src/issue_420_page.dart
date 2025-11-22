import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// https://github.com/peiffer-innovations/json_dynamic_widget/issues/420
class Issue420Page extends StatelessWidget {
  Issue420Page({super.key});

  final JsonWidgetData data = JsonWidgetData.fromDynamic({
    "type": "set_value",
    "args": {
        "cleanup":false,
        "values": {
            "template": {
                "type": "elevated_button",
                "args": {
                    "child": {
                        "type": "text",
                        "args": {
                            "text": "\${key}"
                        }
                    },
                    "onPressed": "\${set_value('myvalue','value :'+value['id'])}"
                }
            },
            "myvalue": "INITIAL",
            "array": [
                {"id": "1"},
                {"id": "2"},
                {"id": "3"}
            ]
        },
        "child": {
            "type": "column",
            "args": {
                "children": [
                    {
                        "type": "text",
                        "listen": [
                            "myvalue"
                        ],
                        "args": {
                            "text": "\${'value: ' + myvalue}"
                        }
                    },
                    {
                        "type": "column",
                        "args": {
                            "children": "\${for_each(array,'template')}"
                        }
                    }
                ]
            }
        }
    }
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue 420')),
      body: Center(child: data.build(context: context)),
    );
  }
}
