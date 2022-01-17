import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/functions/dynamic.dart'
    as dynamic_fun;
import 'package:json_dynamic_widget/src/components/functions/for_each.dart'
    as for_each_fun;
import 'package:json_dynamic_widget/src/components/functions/length.dart'
    as length_fun;
import 'package:json_dynamic_widget/src/components/functions/log.dart'
    as log_fun;
import 'package:json_dynamic_widget/src/components/functions/navigate_named.dart'
    as navigate_named_fun;
import 'package:json_dynamic_widget/src/components/functions/navigate_pop.dart'
    as navigate_pop_fun;
import 'package:json_dynamic_widget/src/components/functions/noop.dart'
    as noop_fun;
import 'package:json_dynamic_widget/src/components/functions/remove_value.dart'
    as remove_value_fun;
import 'package:json_dynamic_widget/src/components/functions/set_value.dart'
    as set_value_fun;
import 'package:json_dynamic_widget/src/components/json_widget_internal_builders.dart';
import 'package:json_dynamic_widget/src/schema/schema_validator.dart';
import 'package:logging/logging.dart';

/// Registry for both the library provided as well as custom form builders that
/// the application may provide.
///
/// This provides a default [instance] that can be used for an entire
/// application.  Applications that need a custom registry for specific use
/// cases can instead create a new one to pass to the [JsonWidgetData].
///
/// Applications wishing to provide their own widget builders must register them
/// via the [registerCustomBuilder] function before they are needed by the form.
/// This should typically happen within the `main` function of the application.
///
/// By default, JSON schema validation is enabled in DEBUG builds.  It is always
/// disabled in RELEASE builds.  To disable validation even in DEBUG builds, set
/// [disableValidation] to [true].
class JsonWidgetRegistry {
  /// Constructs a one-off registry.  This accepts an optional group of custom
  /// widget [builders], custom widget [functions], and widget [values].
  JsonWidgetRegistry({
    Map<String, JsonWidgetBuilderContainer>? builders,
    String? debugLabel,
    this.disableValidation = false,
    Map<String, JsonWidgetFunction>? functions,
    this.navigatorKey,
    JsonWidgetRegistry? parent,
    List<ArgProcessor>? argProcessors,
    Map<String, dynamic>? values,
  })  : debugLabel = (parent != null ? '${parent.debugLabel}.' : '') +
            (debugLabel ?? 'child_${++childCount}'),
        _parent = parent {
    _logger = Logger('REGISTRY ${this.debugLabel}');
    _customBuilders.addAll(builders ?? {});
    _functions.addAll(functions ?? {});
    _values.addAll(values ?? {});
    _parentDisposeStreamSubscription =
        parent?.disposeStream.listen((_) => dispose());
    _argProcessors = argProcessors ?? ArgProcessors.defaults;
    _parentValueStreamSubscription = parent?.valueStream
        .listen((event) => _valueStreamController?.add(event));
  }

  static final JsonWidgetRegistry instance = JsonWidgetRegistry(
    debugLabel: 'default',
  );

  static int childCount = 0;

  final _customBuilders = <String, JsonWidgetBuilderContainer>{};
  final String debugLabel;

  final bool disableValidation;
  final _functions = <String, JsonWidgetFunction>{};
  final _internalBuilders = JsonWidgetInternalBuilders.builders;
  final _internalFunctions = <String, JsonWidgetFunction>{
    dynamic_fun.key: dynamic_fun.body,
    for_each_fun.key: for_each_fun.body,
    length_fun.key: length_fun.body,
    log_fun.key: log_fun.body,
    navigate_named_fun.key: navigate_named_fun.body,
    navigate_pop_fun.key: navigate_pop_fun.body,
    noop_fun.key: noop_fun.body,
    remove_value_fun.key: remove_value_fun.body,
    set_value_fun.key: set_value_fun.body,
  };
  final _internalValues = <String, dynamic>{}..addAll(
      CurvesValues.values,
    );
  final JsonWidgetRegistry? _parent;
  final _values = <String?, dynamic>{};
  List<ArgProcessor> _argProcessors = [];

  StreamController<void>? _disposeStreamController =
      StreamController<void>.broadcast();
  late Logger _logger;
  StreamSubscription<void>? _parentDisposeStreamSubscription;
  StreamSubscription<String>? _parentValueStreamSubscription;
  StreamController<String>? _valueStreamController =
      StreamController<String>.broadcast();

  /// A navigator key that is required in order to use the
  /// [fun_key_navigate_named] and [fun_key_navigate_pop] functions.  This holds
  /// the navigator state that will be used to push the named route to the
  /// stack.
  ///
  /// For the key to be useful, it must have been also passed to an object that
  /// maintains a navigation stack, such as a [MaterialApp].  Example:
  /// ```dart
  /// MaterialApp(
  ///   navigatorKey: navigatorKey
  /// )
  /// ```
  GlobalKey<NavigatorState>? navigatorKey;

  /// Returns the [Stream] that an element can listen to in order to be notified
  /// when the registry is disposed.  Typically this should only be used by
  /// child registries listening to notifications from their parent registries.
  Stream<void> get disposeStream => _disposeStreamController!.stream;

  /// Returns an unmodifiable reference to the internal set of functions.
  Map<String, JsonWidgetFunction> get functions =>
      Map.unmodifiable(Map.from(_internalFunctions)..addAll(_functions));

  /// Returns an unmodifiable reference to the internal set of values.
  Map<String, dynamic> get values => Map.unmodifiable(
        Map.from(_values)
          ..addAll(
            _parent?.values ?? const <String, dynamic>{},
          ),
      );

  /// Returns the [Stream] that an element can listen to in order to be notified
  /// when a value has changed.
  Stream<String> get valueStream => _valueStreamController!.stream;

  /// Removes all variable values from the registry
  void clearValues() {
    var keys = Set<String>.from(_values.keys);
    _values.clear();

    keys.forEach((element) => _valueStreamController?.add(element));
  }

  // Copies the contents of the registry into a new registry.
  JsonWidgetRegistry copyWith({
    Map<String, JsonWidgetBuilderContainer>? builders,
    String? debugLabel,
    bool? disableValidation,
    Map<String, JsonWidgetFunction>? functions,
    GlobalKey<NavigatorState>? navigatorKey,
    List<ArgProcessor>? argProcessors,
    JsonWidgetRegistry? parent,
    Map<String, dynamic>? values,
  }) =>
      JsonWidgetRegistry(
        builders: builders ?? Map.from(_customBuilders),
        debugLabel: debugLabel ?? this.debugLabel,
        disableValidation: disableValidation ?? this.disableValidation,
        functions: functions ?? _functions,
        navigatorKey: navigatorKey ?? this.navigatorKey,
        parent: parent ?? this,
        argProcessors: argProcessors ?? _argProcessors,
        values: values ?? Map.from(_values),
      );

  /// Disposes the registry.
  void dispose() {
    _disposeStreamController?.add(null);
    _disposeStreamController?.close();
    _disposeStreamController = null;

    _parentDisposeStreamSubscription?.cancel();
    _parentDisposeStreamSubscription = null;

    _parentValueStreamSubscription?.cancel();
    _parentValueStreamSubscription = null;

    _valueStreamController?.close();
    _valueStreamController = null;
  }

  /// Returns the variable value for the given [key].This will first check for
  /// a custom dynamic value using the [key], and if none is found, this will
  /// then check the internal values. If a variable with named [key] cannot be
  /// found, this will return [null].
  dynamic getValue(String? key) {
    var originalKey = key;

    var value = _values[key] ?? _internalValues[key];
    value ??= _parent?.getValue(key);

    _logger.finest(
      '[getValue]: [$originalKey] = [${value?.toString().substring(0, min(80, value?.toString().length ?? 0))}]',
    );

    return value;
  }

  /// Returns the function with the given [functionName].
  /// If a function with named [functionName] cannot be
  /// found, this will return [null].
  JsonWidgetFunction? getFunction(String? functionName) {
    JsonWidgetFunction? function;
    if (functionName != null) {
      function = _functions[functionName] ?? _internalFunctions[functionName];
    }
    return function;
  }

  /// Executes the dynamic function named [key].  This will first check  for a
  /// custom dynamic function using the [key], and if none is found, this will
  /// then check the internal functions.  If no function can be found in either
  /// collection, this will throw an [Exception].
  dynamic execute(
    String? key,
    Iterable<dynamic>? args,
  ) {
    var fun = _functions[key!] ?? _internalFunctions[key];
    if (fun == null) {
      if (_parent == null) {
        throw Exception(
            'No function named "$key" found in the registry [$debugLabel].');
      } else {
        return _parent!.execute(key, args);
      }
    }

    return fun(
      args: args as List<dynamic>?,
      registry: this,
    );
  }

  /// Returns the builder for the requested [type].  This will first search the
  /// registered custom builders, then if no builder is found, this will then
  /// search the library provided builders.
  ///
  /// If no builder is registered for the given [type] then this will throw an
  /// [Exception].
  JsonWidgetBuilderBuilder getWidgetBuilder(String type) {
    var container = _customBuilders[type] ?? _internalBuilders[type];

    var builder = container?.builder ?? _parent?.getWidgetBuilder(type);

    if (builder == null) {
      throw Exception(
          'No widget with type: "$type" found in the registry [$debugLabel].');
    }

    return builder;
  }

  ProcessedArg processArgs(dynamic args, Set<String>? listenVariables) {
    return _argProcessors
        .firstWhere(
          (parser) => parser.support(args),
          orElse: () => RawArgProcessor(),
        )
        .process(this, args, listenVariables);
  }

  /// Registers the widget type with the registry to that [type] can be used in
  /// custom forms.  Types registered by the application take precidence over
  /// built in registered builders.  This allows an application the ability to
  /// provide custom widgets even for built in form types.
  ///
  /// If the [container] has an associated schema id then in DEBUG builds, that
  /// schema will be used to validate the attributes sent to the builder.
  void registerCustomBuilder(
    String type,
    JsonWidgetBuilderContainer container,
  ) =>
      _customBuilders[type] = container;

  /// Registers the custom builders.  This is a convenience method that calls
  /// [registerCustomBuilder] for each entry in [containers].
  void registerCustomBuilders(
    Map<String, JsonWidgetBuilderContainer> containers,
  ) =>
      containers.forEach((key, value) => registerCustomBuilder(key, value));

  /// Registers the [key] as function name with the registry to be used in
  /// function bindings.  Functions registered by the application take
  /// precidence over built in registered functions.  This allows the
  /// application the ability to provide custom functions even for built in
  /// [key]'s.
  void registerFunction(
    String key,
    JsonWidgetFunction fun,
  ) {
    assert(key.isNotEmpty == true);

    _functions[key] = fun;
  }

  /// Registers the function bindings.  This is a convenience method that calls
  /// [registerFunction] for each entry in [functions].
  void registerFunctions(Map<String, JsonWidgetFunction> functions) =>
      functions.forEach((key, value) => registerFunction(key, value));

  /// Removes the [key] from the registry.
  ///
  /// If, and only if, the [key] was registered on the registry will this fire
  /// an event on the [valueStream] with the [key] so listeners can be notified
  /// that the value has changed.
  dynamic removeValue(String key) {
    assert(key.isNotEmpty == true);

    var hasKey = _values.containsKey(key);
    var result = _values.remove(key);
    if (hasKey == true) {
      _valueStreamController?.add(key);
    }

    return result;
  }

  /// Sets the [value] for the [key] on the registry.  If the [value] is [null],
  /// this redirects to [removeValue].
  ///
  /// If the [value] is different than the current value for the [key] then this
  /// will fire an event on the [valueStream] with the [key] so listeners can be
  /// notified that it has changed.
  void setValue(
    String key,
    dynamic value,
  ) {
    assert(key.isNotEmpty == true);
    if (value == null) {
      removeValue(key);
    } else {
      var current = _values[key];

      var equals = current == value;
      if (current is List || current is Set || current is Map) {
        equals = DeepCollectionEquality().equals(current, value);
      }
      if (!equals) {
        _logger.finest(
          '[setValue]: [$key] = [${value?.toString().substring(0, min(80, value?.toString().length ?? 0))}]',
        );
        _values[key] = value;
        _valueStreamController?.add(key);
      }
    }
  }

  @override
  String toString() => 'JsonWidgetRegistry{$debugLabel}';

  /// Removes a registered [type] from the custom registry and returns the
  /// associated builder, if one exists.  If the [type] is not registered then
  /// this will [null].
  JsonWidgetBuilderContainer? unregisterCustomBuilder(String type) =>
      _customBuilders.remove(type);

  JsonWidgetFunction? unregisterFunction(String key) {
    assert(key.isNotEmpty == true);

    return _functions.remove(key);
  }

  /// Validates the builder against it's value.  This will only perform a
  /// validation if a schema id is associated with builder.
  ///
  /// Because the validation is relatively expensive, the validation will only
  /// happen in DEBUG builds.  In either RELEASE or PROFILE builds, this is
  /// disabled and will always return [true].
  bool validateBuilderSchema({
    required String type,
    required dynamic value,
    bool validate = true,
  }) {
    var result = true;

    assert(() {
      if (disableValidation != true) {
        var container = _customBuilders[type] ?? _internalBuilders[type];
        if (container?.schemaId != null) {
          result = SchemaValidator().validate(
            schemaId: container!.schemaId,
            value: value,
            validate: validate,
          );
        }
      }
      return true;
    }());

    return result;
  }
}
