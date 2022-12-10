import 'dart:async';

import 'package:child_builder/child_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';
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
    required this.numSupportedChildren,
  }) : assert(numSupportedChildren >= -1);

  static final JsonWidgetData kDefaultChild = JsonWidgetData(
    args: const {},
    builder: () => JsonSizedBoxBuilder(),
    child: null,
    listenVariables: const {},
    registry: JsonWidgetRegistry.instance,
    type: JsonSizedBoxBuilder.type,
  );

  final bool preferredSizeWidget;
  final int numSupportedChildren;

  /// Builds the widget.  If there are dynamic keys on the [data] object, and
  /// the widget is not a [PreferredSizeWidget], then the returned widget will
  /// be wrapped by a stateful widget that will rebuild if any of the dynamic
  /// args change in value.
  @nonVirtual
  Widget build({
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) {
    late Widget result;

    if (preferredSizeWidget == true ||
        data.listenVariables.isNotEmpty != true) {
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
        key: ValueKey('json_widget_stateful.${data.id}'),
      );
    }

    return result;
  }

  /// Custom builder that subclasses must override and implement to return the
  /// actual [Widget] to be placed on the tree.
  @visibleForOverriding
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });

  /// Returns a non-null child for widgets that must always have child widgets.
  /// This allows the widget to be built and rendered even if the child is
  /// missing.
  @protected
  JsonWidgetData getChild(JsonWidgetData? data, {int index = 0}) {
    late JsonWidgetData child;

    if (data?.children?.isNotEmpty == true && data!.children!.length > index) {
      child = data.children![index];
    } else {
      child = kDefaultChild;
    }

    return child;
  }

  /// Called when a JSON widget is removed from the tree due to a conditional.
  /// Custom widgets may need to implement this to clean up values that may have
  /// been placed on the [JsonWidgetRegistry] by the widget.
  ///
  /// If you override this, make sure to end your method with a call to
  /// super.remove(data).
  @mustCallSuper
  void remove(JsonWidgetData data) {
    for (var child in data.children ?? <JsonWidgetData>[]) {
      child.builder().remove(child);
    }
  }

  Widget _buildWidget({
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) {
    var key = ValueKey(data.id);

    dynamic exception;
    StackTrace? stackTrace;
    var widget = runZonedGuarded(() {
      return buildCustom(
        childBuilder: childBuilder,
        context: context,
        data: data,
        key: key,
      );
    }, (e, stack) {
      exception = e;
      stackTrace = stack;
    });

    if (widget == null) {
      if (exception is HandledJsonWidgetException) {
        throw exception;
      } else {
        throw HandledJsonWidgetException(
          exception,
          stackTrace,
          data: data.toJson(),
        );
      }
    }

    if (childBuilder != null) {
      widget = childBuilder(context, widget);
    }

    return widget;
  }
}

class _JsonWidgetStateful extends StatefulWidget {
  _JsonWidgetStateful({
    required this.childBuilder,
    required this.customBuilder,
    required this.data,
    Key? key,
  }) : super(key: key);

  final ChildWidgetBuilder? childBuilder;
  final Widget? Function({
    required ChildWidgetBuilder childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) customBuilder;
  final JsonWidgetData data;

  @override
  _JsonWidgetStatefulState createState() => _JsonWidgetStatefulState();
}

class _JsonWidgetStatefulState extends State<_JsonWidgetStateful> {
  static final Logger _logger = Logger('_JsonWidgetStatefulState');

  late JsonWidgetData _data;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _data = widget.data;

    _subscription = widget.data.registry.valueStream.listen((event) {
      if (_data.listenVariables.contains(event.id) == true) {
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
  Widget build(BuildContext context) {
    var sub = runZonedGuarded(
        (() => _data.builder().buildCustom(
              childBuilder: widget.childBuilder,
              context: context,
              data: _data,
              key: ValueKey(_data.id),
            )), (e, stack) {
      _logger.severe(
        'Error building widget: [${_data.type}].',
        e,
        stack,
      );
    });

    if (widget.childBuilder != null) {
      sub = widget.childBuilder!(context, sub!);
    }

    return sub!;
  }
}
