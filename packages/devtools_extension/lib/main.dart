import 'dart:convert';

import 'package:devtools_app_shared/ui.dart';
import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:highlight/languages/json.dart' as json_lang;
import 'package:highlight/languages/yaml.dart' as yaml_lang;
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_devtools_extension/animated_button.dart';
import 'package:yaml_writer/yaml_writer.dart';

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
  bool _isJsonFormat = true;
  final JsonWidgetRegistry _jsonWidgetRegistry = JsonWidgetRegistry.instance;
  var _controller = CodeController(
    language: json_lang.json,
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

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final vmService = await serviceManager.onServiceAvailable;

      vmService.onExtensionEvent.listen((event) {
        final isUpdateEvent = event.extensionKind == 'ext.jsonWidgetData.set';
        if (!isUpdateEvent) return;

        var jsonWidgetData = event.extensionData!.data['data'];

        setState(() {
          if (_isJsonFormat) {
            _controller.text =
                JsonEncoder.withIndent('    ').convert(jsonWidgetData);
          } else {
            _controller.text = YamlWriter(indentSize: 4).write(jsonWidgetData);
          }
          _previewWidget();
        });
      });
    });
  }

  final ScrollController _scrollControllerRight = ScrollController();
  final _copyButtonKey = GlobalKey<AnimatedButtonState>();
  final _refreshButtonKey = GlobalKey<AnimatedButtonState>();
  final _formatButtonKey = GlobalKey<AnimatedButtonState>();

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
              if (constraints.maxWidth < 60) {
                return Container();
              }
              var toggleButtonMaxWidth = _estimateButtonMaxWidth("JSON");
              var previewButtonMaxWidth = _estimateButtonMaxWidth("Previewed");
              var copyButtonMaxWidth = _estimateButtonMaxWidth("Copied");
              var formatButtonMaxWidth = _estimateButtonMaxWidth("Formatted");
              var buttons = [
                DevToolsButton(
                  onPressed: () => _toggleFormat(),
                  icon: Icons.swap_horiz,
                  label: constraints.maxWidth >= toggleButtonMaxWidth
                      ? (_isJsonFormat ? "YAML" : "JSON")
                      : '',
                  tooltip:
                      'Switch to ${_isJsonFormat ? "YAML" : "JSON"} format',
                  color: Colors.white70,
                ),
                _buildAnimatedButton(
                  _copyButtonKey,
                  constraints.maxWidth,
                  copyButtonMaxWidth,
                  "Copy",
                  "Copied",
                  Icons.copy,
                  "Copy to clipboard",
                  _copyWidget,
                ),
                _buildAnimatedButton(
                  _formatButtonKey,
                  constraints.maxWidth,
                  formatButtonMaxWidth,
                  "Format",
                  "Formatted",
                  Icons.format_indent_increase,
                  "Format the ${_isJsonFormat ? "JSON" : "YAML"}",
                  _formatWidget,
                ),
                _buildAnimatedButton(
                  _refreshButtonKey,
                  constraints.maxWidth,
                  previewButtonMaxWidth,
                  "Preview",
                  "Previewed",
                  Icons.remove_red_eye,
                  "Preview the widget",
                  _previewWidget,
                ),
              ];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Theme.of(context).dividerColor.darken(0.5),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: constraints.maxWidth >
                              toggleButtonMaxWidth +
                                  previewButtonMaxWidth +
                                  copyButtonMaxWidth +
                                  formatButtonMaxWidth
                          ? Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: buttons)
                          : Column(
                              children: buttons,
                            ),
                    ),
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
          LayoutBuilder(builder: (context, constraints) {
            return Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              thumbVisibility: true,
              controller: _scrollControllerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildJsonWidgetPreview(context, constraints),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  AnimatedButton _buildAnimatedButton(
    GlobalKey<AnimatedButtonState> key,
    double maxWidth,
    double buttonMaxWidth,
    String text,
    String successText,
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
  ) {
    final buttonText = maxWidth > buttonMaxWidth ? text : "";
    final buttonSuccessText = maxWidth > buttonMaxWidth ? successText : "";
    key.currentState?.setButtonTexts(buttonText, buttonSuccessText);

    return AnimatedButton(
        key: key,
        text: buttonText,
        successsText: buttonSuccessText,
        icon: icon,
        tooltip: tooltip,
        onPressed: () => onPressed(),
        textColor: Colors.white70);
  }

  Widget _buildJsonWidgetPreview(
      BuildContext context, BoxConstraints constraints) {
    Widget widget = Center(child: Text("No widget to preview"));
    try {
      var data = yaon.parse(_controller.text);
      widget = SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: JsonWidgetData.fromDynamic(data)
              .build(context: context, registry: _jsonWidgetRegistry));
    } catch (ex) {
      widget = Center(child: Text("Error: $ex"));
    }
    return KeyedSubtree(
      key: _widgetKey,
      child: widget,
    );
  }

  void _previewWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  void _copyWidget() async {
    await Clipboard.setData(ClipboardData(text: _controller.text));
  }

  void _formatWidget() {
    var data = yaon.parse(_controller.text);
    if (_isJsonFormat) {
      var jsonText = JsonEncoder.withIndent('    ').convert(data);
      _controller.text = jsonText;
    } else {
      var yamlText = YamlWriter(indentSize: 4).write(data);
      _controller.text = yamlText;
    }
  }

  double _estimateButtonMaxWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.bodyMedium),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    var textWidths = textPainter.size.width;
    var paddings = 25;
    var iconsWidth = Theme.of(context).iconTheme.size ?? 24;
    return textWidths + paddings + iconsWidth;
  }

  void _toggleFormat() {
    var data = yaon.parse(_controller.text, normalize: true);
    var newText = _controller.text;
    if (_isJsonFormat) {
      newText = YamlWriter(indentSize: 4).write(data);
    } else {
      var jsonText = JsonEncoder.withIndent('    ').convert(data);
      newText = jsonText;
    }
    setState(() {
      _isJsonFormat = !_isJsonFormat;
      _controller = CodeController(
        text: newText,
        language: _isJsonFormat ? json_lang.json : yaml_lang.yaml,
      );
    });
  }
}
