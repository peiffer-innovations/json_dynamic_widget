import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [Form] widget.  See the [fromDynamic] for the
/// format.
class JsonFormBuilder extends JsonWidgetBuilder {
  JsonFormBuilder({
    this.autovalidateMode,
    this.onChanged,
    this.onWillPop,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 1;
  static const type = 'form';

  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onChanged;
  final WillPopCallback? onWillPop;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autovalidateMode": <AutovalidateMode>,
  ///   "onChanged": <VoidCallback>,
  ///   "onWillPop": <WillPopCallback>
  /// }
  /// ```
  ///
  /// As a note, the [VoidCallback] and [WillPopCallback] cannot be decoded via
  /// JSON.  Instead, the only way to bind those values to the builder is to use
  /// a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [buildCustom]
  ///  * [ThemeDecoder.decodeAutovalidateMode]
  static JsonFormBuilder? fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    JsonFormBuilder? result;

    if (map != null) {
      result = JsonFormBuilder(
        autovalidateMode: map['autovalidate'] == null
            ? ThemeDecoder.decodeAutovalidateMode(map['autovalidateMode'])
            : JsonClass.parseBool(map['autovalidate']) == true
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        onChanged: map['onChanged'],
        onWillPop: map['onWillPop'],
      );
    }

    return result;
  }

  /// If the `id` on the [data] object is non-empty, this will ensure a
  /// [GlobalKey<FormState>] is placed on the [JsonWidgetRegistry] using the
  /// key: "${data.id}.key" so that handler functions can access the form's
  /// state.
  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    var child = getChild(data);

    return _JsonFormWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
      key: key,
      child: child,
    );
  }
}

class _JsonFormWidget extends StatefulWidget {
  _JsonFormWidget({
    required this.builder,
    required this.child,
    required this.childBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final JsonFormBuilder builder;
  final JsonWidgetData? child;
  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData data;

  @override
  _JsonFormWidgetState createState() => _JsonFormWidgetState();
}

class _JsonFormWidgetState extends State<_JsonFormWidget> {
  GlobalKey<FormState>? _key;

  @override
  void initState() {
    super.initState();

    _key = GlobalKey<FormState>();
    widget.data.registry.setValue(
      '${widget.data.id}.key',
      _key,
      originator: '${widget.data.id}.key',
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.data.registry.removeValue(
      '${widget.data.id}.key',
      originator: '${widget.data.id}.key',
    );
  }

  @override
  Widget build(BuildContext context) => Form(
        autovalidateMode: widget.builder.autovalidateMode,
        key: _key,
        onChanged: widget.builder.onChanged,
        onWillPop: widget.builder.onWillPop,
        child: widget.child!.build(
          childBuilder: widget.childBuilder,
          context: context,
        ),
      );
}
