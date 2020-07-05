import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:meta/meta.dart';

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
class JsonWidgetRegistry {
  /// Constructs a one-off registry.  This accepts an optional group of custom
  /// widget [builders], custom widget [functions], and widget [values].
  JsonWidgetRegistry({
    Map<String, JsonClassBuilder<JsonWidgetBuilder>> builders,
    this.debugLabel,
    Map<String, JsonWidgetFunction> functions,
    this.navigatorKey,
    Map<String, dynamic> values,
  }) {
    _customBuilders.addAll(builders ?? {});
    _functions.addAll(functions ?? {});
    _values.addAll(values ?? {});
  }

  /// Function key for the built in `navigate_named` function.  The
  /// `navigate_named` function requires that the [navigatorKey] has been set on
  /// the registry before it is used or an exception will be thrown.
  ///
  /// When called, the `navigate_named` function will push a named route using
  /// the [navigatorKey].
  ///
  /// The `navigate_named` function one or two values on the `args` array:
  ///  1. [String] -- The name of the route to push.
  ///  2. [dynamic] -- <Optional> object to pass along as the route arguments.
  static const fun_key_navigate_named = 'navigate_named';

  /// Function key for the built in `navigate_pop` function.  The `navigate_pop`
  /// function requires that the [navigatorKey] has been set on the registry
  /// before it is used or an exception will be thrown.
  ///
  /// When called, the `navigate_pop` function will call to pop the current
  /// route off the navigator stack.
  ///
  /// The `navigate_pop` accepts a single optional value in the `args` array:
  ///  1. [dynamic] -- <Optional> pop result
  static const fun_key_navigate_pop = 'navigate_pop';

  /// Function key for the built in `set_value` function.  The `set_value`
  /// function accepts a key and a value and then calls the [setValue] function
  /// with those values.
  ///
  /// The `set_value` function takes two values in the `args` array:
  ///  1. [String] -- the key to pass to [setValue].
  ///  2. [dynamic] -- the value to pass to [setValue].
  static const fun_key_set_value = 'set_value';

  static final JsonWidgetRegistry instance = JsonWidgetRegistry(
    debugLabel: 'default',
  );

  final _customBuilders = <String, JsonClassBuilder<JsonWidgetBuilder>>{};
  final String debugLabel;
  final _functions = <String, JsonWidgetFunction>{};
  final _internalBuilders = <String, JsonWidgetBuilderBuilder>{
    JsonAlignBuilder.type: JsonAlignBuilder.fromDynamic,
    JsonAppBarBuilder.type: JsonAppBarBuilder.fromDynamic,
    JsonAspectRatioBuilder.type: JsonAspectRatioBuilder.fromDynamic,
    JsonAssetImageBuilder.type: JsonAssetImageBuilder.fromDynamic,
    JsonBaselineBuilder.type: JsonBaselineBuilder.fromDynamic,
    JsonCardBuilder.type: JsonCardBuilder.fromDynamic,
    JsonCenterBuilder.type: JsonCenterBuilder.fromDynamic,
    JsonCheckboxBuilder.type: JsonCheckboxBuilder.fromDynamic,
    JsonClipRectBuilder.type: JsonClipRectBuilder.fromDynamic,
    JsonClipRRectBuilder.type: JsonClipRRectBuilder.fromDynamic,
    JsonColumnBuilder.type: JsonColumnBuilder.fromDynamic,
    JsonConditionalBuilder.type: JsonConditionalBuilder.fromDynamic,
    JsonContainerBuilder.type: JsonContainerBuilder.fromDynamic,
    JsonCupertinoSwitchBuilder.type: JsonCupertinoSwitchBuilder.fromDynamic,
    JsonDropdownButtonFormFieldBuilder.type:
        JsonDropdownButtonFormFieldBuilder.fromDynamic,
    JsonExpandedBuilder.type: JsonExpandedBuilder.fromDynamic,
    JsonFittedBoxBuilder.type: JsonFittedBoxBuilder.fromDynamic,
    JsonFlatButtonBuilder.type: JsonFlatButtonBuilder.fromDynamic,
    JsonFlexibleBuilder.type: JsonFlexibleBuilder.fromDynamic,
    JsonFormBuilder.type: JsonFormBuilder.fromDynamic,
    JsonGestureDetectorBuilder.type: JsonGestureDetectorBuilder.fromDynamic,
    JsonHeroBuilder.type: JsonHeroBuilder.fromDynamic,
    JsonIconBuilder.type: JsonIconBuilder.fromDynamic,
    JsonIgnorePointerBuilder.type: JsonIgnorePointerBuilder.fromDynamic,
    JsonIndexedStackBuilder.type: JsonIndexedStackBuilder.fromDynamic,
    JsonInkWellBuilder.type: JsonInkWellBuilder.fromDynamic,
    JsonInputErrorBuilder.type: JsonInputErrorBuilder.fromDynamic,
    JsonListTileBuilder.type: JsonListTileBuilder.fromDynamic,
    JsonListViewBuilder.type: JsonListViewBuilder.fromDynamic,
    JsonMaterialBuilder.type: JsonMaterialBuilder.fromDynamic,
    JsonMemoryImageBuilder.type: JsonMemoryImageBuilder.fromDynamic,
    JsonNetworkImageBuilder.type: JsonNetworkImageBuilder.fromDynamic,
    JsonOpacityBuilder.type: JsonOpacityBuilder.fromDynamic,
    JsonPaddingBuilder.type: JsonPaddingBuilder.fromDynamic,
    JsonPositionedBuilder.type: JsonPositionedBuilder.fromDynamic,
    JsonRadioBuilder.type: JsonRadioBuilder.fromDynamic,
    JsonRaisedButtonBuilder.type: JsonRaisedButtonBuilder.fromDynamic,
    JsonRowBuilder.type: JsonRowBuilder.fromDynamic,
    JsonSafeAreaBuilder.type: JsonSafeAreaBuilder.fromDynamic,
    JsonSaveContextBuilder.type: JsonSaveContextBuilder.fromDynamic,
    JsonScaffoldBuilder.type: JsonScaffoldBuilder.fromDynamic,
    JsonSetValueBuilder.type: JsonSetValueBuilder.fromDynamic,
    JsonSetWidgetBuilder.type: JsonSetWidgetBuilder.fromDynamic,
    JsonSingleChildScrollViewBuilder.type:
        JsonSingleChildScrollViewBuilder.fromDynamic,
    JsonSizedBoxBuilder.type: JsonSizedBoxBuilder.fromDynamic,
    JsonStackBuilder.type: JsonStackBuilder.fromDynamic,
    JsonSwitchBuilder.type: JsonSwitchBuilder.fromDynamic,
    JsonTextBuilder.type: JsonTextBuilder.fromDynamic,
    JsonTextFormFieldBuilder.type: JsonTextFormFieldBuilder.fromDynamic,
    JsonThemeBuilder.type: JsonThemeBuilder.fromDynamic,
  };
  final _internalFunctions = <String, JsonWidgetFunction>{
    fun_key_navigate_named: ({
      @required List<dynamic> args,
      @required JsonWidgetRegistry registry,
    }) {
      assert(registry.navigatorKey != null);

      return () => registry.navigatorKey.currentState.pushNamed(
            args[0],
            arguments: args.length >= 2 ? args[1] : null,
          );
    },
    fun_key_navigate_pop: ({
      @required List<dynamic> args,
      @required JsonWidgetRegistry registry,
    }) {
      assert(registry.navigatorKey != null);

      return () => registry.navigatorKey.currentState.pop(
            args?.isNotEmpty == true ? args[0] : null,
          );
    },
    fun_key_set_value: ({
      @required List<dynamic> args,
      @required JsonWidgetRegistry registry,
    }) =>
        () => registry.setValue(
              args[0],
              args[1],
            ),
  };
  final _values = <String, dynamic>{};

  StreamController<String> _valueStreamController =
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
  GlobalKey<NavigatorState> navigatorKey;

  /// Returns an unmodifiable reference to the internal set of values.
  Map<String, dynamic> get values => Map.unmodifiable(_values);

  /// Returns the [Stream] that an element can listen to in order to be notified
  /// when
  Stream<String> get valueStream => _valueStreamController?.stream;

  void clearValues() {
    var keys = Set<String>.from(_values.keys);
    _values.clear();

    keys.forEach((element) => _valueStreamController?.add(element));
  }

  void dispose() {
    _valueStreamController?.close();
    _valueStreamController = null;
  }

  dynamic execute(
    String key,
    Iterable<dynamic> args,
  ) {
    var fun = _functions[key] ?? _internalFunctions[key];
    if (fun == null) {
      throw Exception('No function named "$key" found in the registry.');
    }

    return fun(
      args: args,
      registry: this,
    );
  }

  dynamic getValue(String key) => _values[key];

  /// Returns the builder for the requested [type].  This will first search the
  /// registered custom builders, then if no builder is found, this will then
  /// search the library provided builders.
  ///
  /// If no builder is registered for the given [type] then this will throw an
  /// [Exception].
  JsonWidgetBuilderBuilder getWidgetBuilder(String type) {
    assert(type != null);

    JsonWidgetBuilderBuilder builder;

    builder = _customBuilders[type] ?? _internalBuilders[type];

    if (builder == null) {
      throw Exception('Builder requested for unknown type: $type');
    }

    return builder;
  }

  DynamicParamsResult processDynamicArgs(
    dynamic args, {
    Set<String> dynamicKeys,
  }) {
    dynamicKeys ??= <String>{};

    dynamic result;
    if (args is String) {
      var parsed = JsonWidgetRegexHelper.parse(args);

      if (parsed?.isNotEmpty == true) {
        String functionKey;
        List<dynamic> functionArgs;
        for (var item in parsed) {
          if (item.isFunction == true) {
            dynamicKeys.add(null);

            functionKey = item.key;
            functionArgs = [];
          } else if (item.isVariable == true) {
            dynamicKeys.add(item.key);

            var value = getValue(item.key);
            functionArgs?.add(value);

            result = value;
          } else {
            functionArgs?.add(item.key);
            result = item.key;
          }
        }

        if (functionKey?.isNotEmpty == true) {
          result = execute(functionKey, functionArgs);
        }
      } else {
        result = args;
      }
    } else if (args is Iterable) {
      result = [];
      for (var value in args) {
        result.add(processDynamicArgs(
          value,
          dynamicKeys: dynamicKeys,
        ).values);
      }
    } else if (args is Map) {
      result = {};

      if (args['type'] != null &&
          (args['child'] != null ||
              args['children'] != null ||
              args['args'] != null)) {
        // The entry has a "type" and one of: "child", "children", "args".  This
        // means the item is most like a JsonWidgetData class, so we should not
        // process the args yet.  We should wait until the actual JsonWidgetData
        // gets built.
        result = args;
      } else {
        args.forEach((key, value) {
          result[key] = processDynamicArgs(
            value,
            dynamicKeys: dynamicKeys,
          ).values;
        });
      }
    } else {
      result = args;
    }

    return DynamicParamsResult(
      dynamicKeys: dynamicKeys,
      values: result,
    );
  }

  /// Registers the widget type with the registry to that [type] can be used in
  /// custom forms.  Types registered by the application take precidence over
  /// built in registered builders.  This allows an application the ability to
  /// provide custom widgets even for built in form types.
  void registerCustomBuilder(
    String type,
    JsonClassBuilder<JsonWidgetBuilder> builder,
  ) {
    assert(type != null);
    assert(builder != null);

    _customBuilders[type] = builder;
  }

  /// Registers the custom builders.  This is a convenience method that calls
  /// [registerCustomBuilder] for each entry in [builders].
  void registerCustomBuilders(
    Map<String, JsonClassBuilder<JsonWidgetBuilder>> builders,
  ) =>
      builders?.forEach((key, value) => registerCustomBuilder(key, value));

  /// Registers the [key] as function name with the registry to be used in
  /// function bindings.  Functions registered by the application take
  /// precidence over built in registered functions.  This allows the
  /// application the ability to provide custom functions even for built in
  /// [key]'s.
  void registerFunction(
    String key,
    JsonWidgetFunction fun,
  ) {
    assert(key?.isNotEmpty == true);
    assert(fun != null);

    _functions[key] = fun;
  }

  /// Registers the function bindings.  This is a convenience method that calls
  /// [registerFunction] for each entry in [functions].
  void registerFunctions(Map<String, JsonWidgetFunction> functions) =>
      functions?.forEach((key, value) => registerFunction(key, value));

  dynamic removeValue(String key) {
    assert(key?.isNotEmpty == true);

    var result = _values.remove(key);
    _valueStreamController?.add(key);

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
    assert(key?.isNotEmpty == true);

    if (value == null) {
      removeValue(key);
    } else {
      var current = _values[key];
      if (current != value) {
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
  JsonClassBuilder<JsonWidgetBuilder> unregisterCustomBuilder(String type) {
    assert(type != null);

    return _customBuilders.remove(type);
  }

  JsonWidgetFunction unregisterFunction(String key) {
    assert(key?.isNotEmpty == true);

    return _functions.remove(key);
  }
}
