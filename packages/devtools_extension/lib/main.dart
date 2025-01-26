import 'dart:convert';

import 'package:devtools_app_shared/ui.dart';
import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:highlight/languages/json.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  runApp(JsonDynamicWidgetDevToolsExtension());
}

class JsonDynamicWidgetDevToolsExtension extends StatefulWidget {
  const JsonDynamicWidgetDevToolsExtension({super.key});

  @override
  State<JsonDynamicWidgetDevToolsExtension> createState() =>
      _JsonDynamicWidgetDevToolsExtensionState();
}

class _JsonDynamicWidgetDevToolsExtensionState
    extends State<JsonDynamicWidgetDevToolsExtension> {
  final _controller = CodeController(
    language: json,
    text: """
{
    "type": "center",
    "args": {
        "child": {
            "type": "column",
            "args": {
                "mainAxisSize": "min",
                "children": [
                    {
                        "type": "row",
                        "args": {
                            "mainAxisSize": "min",
                            "children": [
                                {
                                    "type": "elevated_button",
                                    "args": {
                                        "onPressed": "\${set_value('index', 0)}",
                                        "child": {
                                            "type": "text",
                                            "args": {
                                                "text": "One"
                                            }
                                        }
                                    }
                                },
                                {
                                    "type": "sized_box",
                                    "args": {
                                        "width": 16
                                    }
                                },
                                {
                                    "type": "elevated_button",
                                    "args": {
                                        "onPressed": "\${set_value('index', 1)}",
                                        "child": {
                                            "type": "text",
                                            "args": {
                                                "text": "Two"
                                            }
                                        }
                                    }
                                },
                                {
                                    "type": "sized_box",
                                    "args": {
                                        "width": 16
                                    }
                                },
                                {
                                    "type": "elevated_button",
                                    "args": {
                                        "onPressed": "\${set_value('index', 2)}",
                                        "child": {
                                            "type": "text",
                                            "args": {
                                                "text": "Three"
                                            }
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "type": "sized_box",
                        "args": {
                            "height": "16"
                        }
                    },
                    {
                        "type": "indexed_stack",
                        "listen": [
                            "index"
                        ],
                        "args": {
                            "index": "\${index}",
                            "children": [
                                {
                                    "type": "text",
                                    "args": {
                                        "text": "one"
                                    }
                                },
                                {
                                    "type": "text",
                                    "args": {
                                        "text": "two"
                                    }
                                },
                                {
                                    "type": "text",
                                    "args": {
                                        "text": "three"
                                    }
                                }
                            ]
                        }
                    }
                ]
            }
        }
    }
}""",
  );

  Key _widgetKey = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollControllerRight = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DevToolsExtension(
      child: SplitPane(
        splitters: [
          PreferredSize(
            preferredSize: const Size.fromWidth(15.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Theme.of(context).dividerColor.darken(0.5),
                    width: 1.0,
                  ),
                ),
              ),
              child: DefaultSplitter(
                isHorizontal: true,
              ),
            ),
          ),
        ],
        axis: SplitPane.axisFor(context, 1),
        initialFractions: const [2 / 3, 1 / 3],
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 40) {
                return Container();
              }
              var buttons = [
                DevToolsButton(
                  label: constraints.maxWidth > 80 ? "Refresh" : "",
                  icon: Icons.refresh,
                  onPressed: () => _refreshWidget(),
                ),
                DevToolsButton(
                  label: constraints.maxWidth > 80 ? "Copy" : "",
                  icon: Icons.copy,
                  onPressed: () => _copyWidget(),
                ),
                DevToolsButton(
                  label: constraints.maxWidth > 80 ? "Format" : "",
                  icon: Icons.format_indent_increase,
                  onPressed: () => _formatWidget(),
                ),
              ];
              return Column(
                children: [
                  constraints.maxWidth > 250
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buttons)
                      : Column(
                          children: buttons,
                        ),
                  Expanded(
                    child: CodeTheme(
                      data: CodeThemeData(styles: vs2015Theme),
                      child: SingleChildScrollView(
                        child: CodeField(
                          gutterStyle: GutterStyle(
                            showFoldingHandles:
                                constraints.maxWidth > 60 ? true : false,
                            width: constraints.maxWidth > 90 ? 70 : 30,
                            textStyle:
                                TextStyle(color: Colors.grey, height: 1.5),
                            showLineNumbers:
                                constraints.maxWidth > 90 ? true : false,
                          ),
                          controller: _controller,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              thumbVisibility: true,
              controller: _scrollControllerRight,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollControllerRight,
                  child: _buildJsonWidgetPreview(context))),
        ],
      ),
    );
  }

  Widget _buildJsonWidgetPreview(BuildContext context) {
    Widget widget = Center(child: Text("No widget to preview"));
    try {
      var data = jsonDecode(_controller.text);
      widget = JsonWidgetData.fromDynamic(data).build(context: context);
    } catch (ex) {
      widget = Center(child: Text("Error: $ex"));
    }
    return KeyedSubtree(
      key: _widgetKey,
      child: widget,
    );
  }

  void _refreshWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  void _copyWidget() {
    Clipboard.setData(ClipboardData(text: _controller.text))
        .then((_) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'Copied to clipboard',
              textAlign: TextAlign.right,
            ))));
  }

  void _formatWidget() {
    var data = jsonDecode(_controller.text);
    var encoder = JsonEncoder.withIndent("    ");
    _controller.text = encoder.convert(data);
  }
}
