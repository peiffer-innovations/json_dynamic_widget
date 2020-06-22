import 'dart:async';

import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
    Map<String, JsonWidgetFunction> functions,
    Map<String, dynamic> values,
  }) {
    _customBuilders.addAll(builders ?? {});
    _functions.addAll(functions ?? {});
    _values.addAll(values ?? {});
  }

  static final JsonWidgetRegistry instance = JsonWidgetRegistry();

  final _customBuilders = <String, JsonClassBuilder<JsonWidgetBuilder>>{};
  final _functions = <String, JsonWidgetFunction>{};
  final _internalBuilders = <String, JsonClassBuilder<JsonWidgetBuilder>>{
    JsonAlignBuilder.type: JsonAlignBuilder.fromDynamic,
    JsonAppBarBuilder.type: JsonAppBarBuilder.fromDynamic,
    JsonAspectRatioBuilder.type: JsonAspectRatioBuilder.fromDynamic,
    JsonBaselineBuilder.type: JsonBaselineBuilder.fromDynamic,
    JsonCardBuilder.type: JsonCardBuilder.fromDynamic,
    JsonCenterBuilder.type: JsonCenterBuilder.fromDynamic,
    JsonClipRectBuilder.type: JsonClipRectBuilder.fromDynamic,
    JsonClipRRectBuilder.type: JsonClipRRectBuilder.fromDynamic,
    JsonColumnBuilder.type: JsonColumnBuilder.fromDynamic,
    JsonContainerBuilder.type: JsonContainerBuilder.fromDynamic,
    JsonExpandedBuilder.type: JsonExpandedBuilder.fromDynamic,
    JsonFittedBoxBuilder.type: JsonFittedBoxBuilder.fromDynamic,
    JsonFlatButtonBuilder.type: JsonFlatButtonBuilder.fromDynamic,
    JsonFlexibleBuilder.type: JsonFlexibleBuilder.fromDynamic,
    JsonIconBuilder.type: JsonIconBuilder.fromDynamic,
    JsonIndexedStackBuilder.type: JsonIndexedStackBuilder.fromDynamic,
    JsonMaterialBuilder.type: JsonMaterialBuilder.fromDynamic,
    JsonOpacityBuilder.type: JsonOpacityBuilder.fromDynamic,
    JsonPaddingBuilder.type: JsonPaddingBuilder.fromDynamic,
    JsonPositionedBuilder.type: JsonPositionedBuilder.fromDynamic,
    JsonRaisedButtonBuilder.type: JsonRaisedButtonBuilder.fromDynamic,
    JsonRowBuilder.type: JsonRowBuilder.fromDynamic,
    JsonSafeAreaBuilder.type: JsonSafeAreaBuilder.fromDynamic,
    JsonScaffoldBuilder.type: JsonScaffoldBuilder.fromDynamic,
    JsonSingleChildScrollViewBuilder.type:
        JsonSingleChildScrollViewBuilder.fromDynamic,
    JsonSizedBoxBuilder.type: JsonSizedBoxBuilder.fromDynamic,
    JsonStackBuilder.type: JsonStackBuilder.fromDynamic,
    JsonTextBuilder.type: JsonTextBuilder.fromDynamic,
    JsonThemeBuilder.type: JsonThemeBuilder.fromDynamic,
  };
  final _values = <String, dynamic>{};

  StreamController<void> _valueStreamController =
      StreamController<void>.broadcast();

  /// Returns the [Stream] that an element can listen to in order to be notified
  /// when
  Stream<void> get valueStream => _valueStreamController?.stream;

  void clearValues() {
    _values.clear();
    _valueStreamController?.add(null);
  }

  void dispose() {
    _valueStreamController?.close();
    _valueStreamController = null;
  }

  dynamic execute(
    String key,
    Iterable<dynamic> args,
  ) {
    var fun = _functions[key];
    if (fun == null) {
      throw Exception('No function named "$key" found in the registry.');
    }

    return fun(args);
  }

  dynamic getValue(String key) => _values[key];

  /// Returns the builder for the requested [type].  This will first search the
  /// registered custom builders, then if no builder is found, this will then
  /// search the library provided builders.
  ///
  /// If no builder is registered for the given [type] then this will throw an
  /// [Exception].
  JsonClassBuilder<JsonWidgetBuilder> getWidgetBuilder(String type) {
    assert(type != null);

    JsonClassBuilder<JsonWidgetBuilder> builder;

    builder = _customBuilders[type] ?? _internalBuilders[type];

    if (builder == null) {
      throw Exception('Builder requested for unknown type: $type');
    }

    return builder;
  }

  dynamic processDynamicArgs(dynamic args) {
    dynamic result;
    if (args is String) {
      var parsed = JsonWidgetRegexHelper.parse(args);

      if (parsed?.isNotEmpty == true) {
        String functionKey;
        List<dynamic> functionArgs;
        for (var item in parsed) {
          if (item.isFunction == true) {
            functionKey = item.key;
            functionArgs = [];
          } else if (item.isVariable) {
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
        result.add(processDynamicArgs(value));
      }
    } else if (args is Map) {
      result = {};
      args.forEach((key, value) {
        result[key] = processDynamicArgs(value);
      });
    } else {
      result = args;
    }

    return result;
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

  void registerFunction(
    String key,
    JsonWidgetFunction fun,
  ) {
    assert(key?.isNotEmpty == true);
    assert(fun != null);

    _functions[key] = fun;
  }

  dynamic removeValue(String key) {
    assert(key?.isNotEmpty == true);

    var result = _values.remove(key);
    _valueStreamController?.add(null);

    return result;
  }

  void setValue(
    String key,
    dynamic value,
  ) {
    assert(key?.isNotEmpty == true);

    _values[key] = value;
    _valueStreamController?.add(null);
  }

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
