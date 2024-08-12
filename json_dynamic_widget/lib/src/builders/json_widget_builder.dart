import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

/// Builder that builds dynamic widgets from JSON or other Map-like structures.
/// Applications can register their own types and builders through the
/// [JsonWidgetRegistry].
@immutable
abstract class JsonWidgetBuilder {
  /// Constructs the builder by stating whether the widget being built is a
  /// [PreferredSizeWidget] or not.
  const JsonWidgetBuilder({
    required this.args,
    this.preferredSizeWidget = false,
  });

  static final JsonWidgetData kDefaultChild = JsonWidgetData(
    jsonWidgetArgs: const {},
    jsonWidgetBuilder: () => const JsonNoOpBuilder(
      args: <String, dynamic>{},
    ),
    // child: null,
    jsonWidgetListenVariables: const {},
    jsonWidgetRegistry: JsonWidgetRegistry.instance,
    jsonWidgetType: JsonSizedBoxBuilder.kType,
  );

  final dynamic args;
  final bool preferredSizeWidget;

  /// Returns the type of widget this widget contains.
  String get type;

  JsonWidgetBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  });

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

    if (preferredSizeWidget == true || data.jsonWidgetListenVariables.isEmpty) {
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
        key: ValueKey('json_widget_stateful.${data.jsonWidgetId}'),
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

  Widget _buildWidget({
    required ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) {
    final key = ValueKey(data.jsonWidgetId);

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
      if (data.jsonWidgetRegistry.onBuildWidgetFailed != null) {
        return data.jsonWidgetRegistry.onBuildWidgetFailed!(
          context,
          exception,
          stackTrace,
        );
      }
      if (exception is HandledJsonWidgetException) {
        throw exception;
      } else {
        throw HandledJsonWidgetException(
          exception,
          data: data.toJson(),
          stackTrace: stackTrace,
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
  const _JsonWidgetStateful({
    required this.childBuilder,
    required this.customBuilder,
    required this.data,
    super.key,
  });

  final ChildWidgetBuilder? childBuilder;
  final Widget? Function({
    required ChildWidgetBuilder childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
  }) customBuilder;
  final JsonWidgetData data;

  @override
  State createState() => _JsonWidgetStatefulState();
}

class _JsonWidgetStatefulState extends State<_JsonWidgetStateful> {
  static final Logger _logger = Logger('_JsonWidgetStatefulState');

  late JsonWidgetData _data;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _data = widget.data;

    _subscription = widget.data.jsonWidgetRegistry.valueStream.listen((event) {
      if (_data.jsonWidgetListenVariables.contains(event.id) == true) {
        // _data = _data.recreate();
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
    Widget? result;
    try {
      result = _data.jsonWidgetBuilder().buildCustom(
            childBuilder: widget.childBuilder,
            context: context,
            data: _data,
            key: ValueKey(_data.jsonWidgetId),
          );

      if (widget.childBuilder != null) {
        result = widget.childBuilder!(context, result);
      }
    } catch (e, stack) {
      result = SingleChildScrollView(
        child: ErrorWidget.withDetails(message: '''
$e
$stack
'''),
      );
      _logger.severe(
        'Error building widget: [${_data.jsonWidgetType}].',
        e,
        stack,
      );
    }
    return result;
  }
}

abstract class JsonWidgetBuilderModel extends JsonClass {
  const JsonWidgetBuilderModel(this.args);

  final Map<String, dynamic> args;
}
