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
  /// Constructs the builder by stating whether the widget being built is a
  /// [PreferredSizeWidget] or not.
  JsonWidgetBuilder({
    this.preferredSizeWidget = false,
  }) : assert(preferredSizeWidget != null);

  final bool preferredSizeWidget;

  /// Builds the widget.  If there are dynamic keys on the [data] object, and
  /// the widget is not a [PreferredSizeWidget], then the returned widget will
  /// be wrapped by a stateful widget that will rebuild if any of the dynamic
  /// args change in value.
  @nonVirtual
  Widget build({
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
  }) {
    Widget result;

    if (preferredSizeWidget == true || data.dynamicKeys?.isNotEmpty != true) {
      result = _buildWidget(
        childBuilder: childBuilder,
        context: context,
        data: data,
      );
    } else {
      result = _JsonWidgetStateful(
        childBuilder: childBuilder,
        customBuilder: _buildWidget,
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

  /// Called when a JSON widget is removed from the tree due to a conditional.
  /// Custom widgets may need to implement this to clean up values that may have
  /// been placed on the [JsonWidgetRegistry] by the widget.
  ///
  /// If you override this, make sure to end your method with a call to
  /// super.remove(data).
  @mustCallSuper
  void remove(JsonWidgetData data) {
    for (var child in data.children ?? <JsonWidgetData>[]) {
      child.builder.remove(data);
    }
  }

  Widget _buildWidget({
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
  }) {
    var key = data.id?.isNotEmpty == true ? ValueKey(data.id) : null;

    var widget = buildCustom(
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
    Key key,
  })  : assert(customBuilder != null),
        assert(data != null),
        super(key: key);

  final ChildWidgetBuilder childBuilder;
  final Widget Function({
    @required ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
  }) customBuilder;
  final JsonWidgetData data;

  @override
  _JsonWidgetStatefulState createState() => _JsonWidgetStatefulState();
}

class _JsonWidgetStatefulState extends State<_JsonWidgetStateful> {
  JsonWidgetData _data;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    _data = widget.data;
    _subscription = widget.data.registry.valueStream.listen((event) {
      if (_data.dynamicKeys?.contains(event) == true) {
        _data = _data.recreate();
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
  Widget build(BuildContext context) => _data.builder.buildCustom(
        childBuilder: widget.childBuilder,
        context: context,
        data: _data,
      );
}
