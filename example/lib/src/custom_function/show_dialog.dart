import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

final JsonWidgetFunction body = ({
  List<dynamic>? args,
  required JsonWidgetRegistry registry,
}) =>
    () {
      if (args != null && args.length == 2) {
        final String buildContextVarName = args[0];
        final String dialogDataVarName = args[1];

        BuildContext context = registry.getValue(buildContextVarName);
        var dialogData =
            DialogData.fromJson(registry.getValue(dialogDataVarName));

        var title = JsonWidgetData.fromDynamic(
          dialogData.title,
          registry: registry,
        )!
            .build(
          context: context,
        );
        var content = JsonWidgetData.fromDynamic(
          dialogData.content,
          registry: registry,
        )!
            .build(context: context);
        List<Widget> actions = dialogData.actions
            .map(
              (actionData) => TextButton(
                onPressed: () {
                  actionData.onPressed();
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: JsonWidgetData.fromDynamic(
                  actionData.title,
                  registry: registry,
                )!
                    .build(context: context),
              ),
            )
            .toList();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: title,
            content: content,
            actions: actions,
          ),
        );
      }
    };
final String key = 'show_dialog';

class ActionData extends JsonClass {
  ActionData({
    required this.title,
    required this.onPressed,
  });
  factory ActionData.fromJson(dynamic json) {
    return ActionData(
      title: Map<String, dynamic>.from(
        json['title'],
      ),
      onPressed: json['onPressed'],
    );
  }

  Map<String, dynamic> title;

  Function onPressed;

  @override
  Map<String, dynamic> toJson() {
    return {'title': title, 'onPressed': onPressed};
  }
}

class DialogData extends JsonClass {
  DialogData({
    required this.title,
    required this.content,
    required this.actions,
  });

  factory DialogData.fromJson(dynamic json) {
    return DialogData(
      title: Map<String, dynamic>.from(
        json['title'],
      ),
      content: Map<String, dynamic>.from(
        json['content'],
      ),
      actions: List.from(
        json['actions'],
      ).map(
        (actionJson) => ActionData.fromJson(actionJson),
      ),
    );
  }

  Map<String, dynamic> title;

  Map<String, dynamic> content;

  Iterable<ActionData> actions;

  @override
  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}
