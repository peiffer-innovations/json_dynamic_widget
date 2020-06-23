import 'dart:async';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:meta/meta.dart';

/// Builder that builds dynamic widgets from JSON or other Map-like structures.
/// Applications can register their own types and builders through the
/// [JsonWidgetRegistry].
@immutable
abstract class JsonWidgetBuilder {
  /// Builds the widget by optionally wrapping it in the [Theme] should one be
  /// set.  Subclasses should not override this and should instead implement the
  /// [buildCustom] function instead.
  @nonVirtual
  Widget build({
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
  }) {
    Widget result;
    if (data.dynamicKeys?.isNotEmpty == true) {
      result = _JsonWidgetStateful(
        childBuilder: childBuilder,
        customBuilder: buildCustom,
        data: data,
      );
    } else {
      result = _JsonWidgetStateless(
        childBuilder: childBuilder,
        customBuilder: buildCustom,
        data: data,
      );
    }

    return result;
  }

  /// Custom builder that subclasses must override and implement to return the
  /// actual [Widget] to be placed on the tree.
  @visibleForOverriding
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  });
}

class _JsonWidgetStateless extends StatelessWidget {
  _JsonWidgetStateless({
    @required this.childBuilder,
    @required this.customBuilder,
    @required this.data,
    Key key,
  })  : assert(childBuilder != null),
        assert(customBuilder != null),
        assert(data != null),
        super(key: key);

  final ChildWidgetBuilder childBuilder;
  final Widget Function({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) customBuilder;
  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) {
    var key = data.id?.isNotEmpty == true ? ValueKey(data.id) : null;

    var widget = customBuilder(
      childBuilder: childBuilder,
      context: context,
      data: data,
      key: key,
    );

    if (childBuilder != null) {
      widget = childBuilder(context, widget);
    }

    return widget;
  }
}

class _JsonWidgetStateful extends StatefulWidget {
  _JsonWidgetStateful({
    @required this.childBuilder,
    @required this.customBuilder,
    @required this.data,
    @required this.registry,
    Key key,
  })  : assert(childBuilder != null),
        assert(customBuilder != null),
        assert(data != null),
        assert(registry != null),
        super(key: key);

  final ChildWidgetBuilder childBuilder;
  final Widget Function({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) customBuilder;
  final JsonWidgetData data;
  final JsonWidgetRegistry registry;

  @override
  _JsonWidgetStatefulState createState() => _JsonWidgetStatefulState();
}

class _JsonWidgetStatefulState extends State<_JsonWidgetStateful> {
  JsonWidgetData data;

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    data = widget.data;
    _subscription = widget.registry.valueStream.listen((event) {
      if (data.dynamicKeys?.contains(null) == true ||
          data.dynamicKeys?.contains(event) == true) {
        data = data.recreate();
        if (mounted == true) {
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _JsonWidgetStateless(
        childBuilder: widget.childBuilder,
        customBuilder: widget.customBuilder,
        data: data,
      );
}
