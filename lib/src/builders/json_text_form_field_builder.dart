import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'json_text_form_field_builder.g.dart';

@jsonWidget
abstract class _JsonTextFormFieldBuilder extends JsonWidgetBuilder {
  _JsonTextFormFieldBuilder({
    required super.numSupportedChildren,
  });

  final TextEditingController _controller = TextEditingController();

  @JsonParamSchema('decoration')
  static Map<String, dynamic> _inputDecorationSchema() =>
      SchemaHelper.objectSchema(InputDecorationDecoder.schemaId);

  @JsonParamDecoder('controller')
  TextEditingController _decodeController() => _controller;

  @JsonParamDecoder('decoration')
  InputDecoration? _decodeInputDecoration({
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetRegistry registry,
    required dynamic value,
  }) =>
      value == null
          ? null
          : InputDecorationDecoder.fromDynamic(
              value,
              childBuilder: childBuilder,
              context: context,
              registry: registry,
            );

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) =>
      _TextFormField(
        builder: this,
        data: data,
        child: _buildCustom(
          childBuilder: childBuilder,
          context: context,
          data: data,
          key: key,
        ),
      );

  @JsonBuilder()
  TextFormField _buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _TextFormField extends StatefulWidget {
  const _TextFormField({
    required this.builder,
    required this.child,
    required this.data,
  });

  final _JsonTextFormFieldBuilder builder;
  final Widget child;
  final JsonWidgetData data;

  @override
  State createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  String _text = '';

  @override
  void initState() {
    super.initState();

    final controller = widget.builder._controller;

    widget.data.registry.valueStream
        .where((event) => !event.isSelfTriggered && event.id == widget.data.id)
        .listen(
      (event) {
        final value = widget.data.registry.getValue(widget.data.id);
        final textValue = controller.value.copyWith(
          text: value,
          selection: TextSelection(
            baseOffset: value.length,
            extentOffset: value.length,
          ),
          composing: TextRange(
            start: 0,
            end: value.length,
          ),
        );
        controller.value = textValue;
      },
    );

    controller.addListener(() {
      if (widget.data.id.isNotEmpty == true && _text != controller.text) {
        _text = controller.text;
        widget.data.registry.setValue(
          widget.data.id,
          _text,
          originator: widget.data.id,
        );
      }
    });
  }

  @override
  void dispose() {
    widget.builder._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
