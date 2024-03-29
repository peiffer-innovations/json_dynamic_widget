class WidgetMetadata {
  factory WidgetMetadata() => instance;
  WidgetMetadata._();

  static final WidgetMetadata instance = WidgetMetadata._();

  final List<WidgetInfo> _cache = [];
  final Map<String, String> argSchemas = {};

  List<WidgetInfo> get data {
    final result = List<WidgetInfo>.from(_cache);

    result.sort();

    return result;
  }

  void add({
    required bool autoRegister,
    required String builder,
    required bool constBuilder,
    required String schema,
    required String widget,
  }) {
    widget = widget.startsWith('_') ? widget.substring(1) : widget;
    widget = widget.replaceAll(RegExp(r'\<.*\>'), '');

    _cache.add(
      WidgetInfo(
        autoRegister: autoRegister,
        builder: builder,
        constBuilder: constBuilder,
        schema: schema,
        widget: widget,
      ),
    );
  }
}

class WidgetInfo implements Comparable<WidgetInfo> {
  const WidgetInfo({
    required this.autoRegister,
    required this.builder,
    required this.constBuilder,
    required this.schema,
    required this.widget,
  });

  final bool autoRegister;
  final String builder;
  final bool constBuilder;
  final String schema;
  final String widget;

  @override
  int compareTo(WidgetInfo other) =>
      widget.toLowerCase().compareTo(other.widget.toLowerCase());
}
