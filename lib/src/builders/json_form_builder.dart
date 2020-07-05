import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// Builder that can build an [Form] widget.  See the [fromDynamic] for the
/// format.
class JsonFormBuilder extends JsonWidgetBuilder {
  JsonFormBuilder({
    this.autovalidate,
    this.onChanged,
    this.onWillPop,
  });

  static const type = 'form';

  final bool autovalidate;
  final VoidCallback onChanged;
  final WillPopCallback onWillPop;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "autovalidate": <bool>,
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
  static JsonFormBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonFormBuilder result;

    if (map != null) {
      result = JsonFormBuilder(
        autovalidate: JsonClass.parseBool(map['autovalidate']),
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
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonFormBuilder] only supports exactly one child.',
    );

    return _JsonFormWidget(
      builder: this,
      childBuilder: childBuilder,
      data: data,
    );
  }
}

class _JsonFormWidget extends StatefulWidget {
  _JsonFormWidget({
    @required this.builder,
    @required this.childBuilder,
    @required this.data,
  })  : assert(builder != null),
        assert(data != null);

  final JsonFormBuilder builder;
  final ChildWidgetBuilder childBuilder;
  final JsonWidgetData data;

  @override
  _JsonFormWidgetState createState() => _JsonFormWidgetState();
}

class _JsonFormWidgetState extends State<_JsonFormWidget> {
  GlobalKey<FormState> _key;

  @override
  void initState() {
    super.initState();

    if (widget.data.id?.isNotEmpty == true) {
      _key = GlobalKey<FormState>();
      widget.data.registry.setValue('${widget.data.id}.key', _key);
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.data.id?.isNotEmpty == true) {
      widget.data.registry.removeValue('${widget.data.id}.key');
    }
  }

  @override
  Widget build(BuildContext context) => Form(
        autovalidate: widget.builder.autovalidate,
        key: _key,
        onChanged: widget.builder.onChanged,
        onWillPop: widget.builder.onWillPop,
        child: widget.data.build(
          childBuilder: widget.childBuilder,
          context: context,
        ),
      );
}
