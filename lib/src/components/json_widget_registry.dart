import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/components/values/values.dart';
import 'package:json_dynamic_widget/src/schema/schema_validator.dart';
import 'package:json_dynamic_widget/src/schema/schemas/container_schema.dart';
import 'package:json_dynamic_widget/src/schema/schemas/cupertino_switch_schema.dart';
import 'package:meta/meta.dart';

import '../schema/all.dart';

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
    Map<String, JsonClassBuilder<JsonWidgetBuilder>> builders,
    this.debugLabel,
    this.disableValidation = false,
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

  /// Function key for the built in `remove_value` function.  The `remove_value`
  /// function accepts a key and a value and then calls the [removeValue]
  /// function.
  ///
  /// The `remove_value` function takes one value in the `args` array:
  ///  1. [String] -- the key to pass to [removeValue].
  static const fun_key_remove_value = 'remove_value';

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

  final _customBuilders = <String, JsonWidgetBuilderContainer>{};
  final String debugLabel;
  final bool disableValidation;
  final _functions = <String, JsonWidgetFunction>{};
  final _internalBuilders = <String, JsonWidgetBuilderContainer>{
    JsonAlignBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonAlignBuilder.fromDynamic,
      schemaId: AlignSchema.id,
    ),
    JsonAnimatedOpacityBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonAnimatedOpacityBuilder.fromDynamic,
      schemaId: AnimatedOpacitySchema.id,
    ),
    JsonAppBarBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonAppBarBuilder.fromDynamic,
      schemaId: AppBarSchema.id,
    ),
    JsonAspectRatioBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonAspectRatioBuilder.fromDynamic,
      schemaId: AspectRatioSchema.id,
    ),
    JsonAssetImageBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonAssetImageBuilder.fromDynamic,
      schemaId: AssetImageSchema.id,
    ),
    JsonBaselineBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonBaselineBuilder.fromDynamic,
      schemaId: BaselineSchema.id,
    ),
    JsonButtonBarBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonButtonBarBuilder.fromDynamic,
      schemaId: ButtonBarSchema.id,
    ),
    JsonCardBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonCardBuilder.fromDynamic,
      schemaId: CardSchema.id,
    ),
    JsonCenterBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonCenterBuilder.fromDynamic,
      schemaId: CenterSchema.id,
    ),
    JsonCheckboxBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonCheckboxBuilder.fromDynamic,
      schemaId: CheckboxSchema.id,
    ),
    JsonCircularProgressIndicatorBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonCircularProgressIndicatorBuilder.fromDynamic,
      schemaId: CircularProgressIndicatorSchema.id,
    ),
    JsonClipOvalBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonClipOvalBuilder.fromDynamic,
      schemaId: ClipOvalSchema.id,
    ),
    JsonClipRectBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonClipRectBuilder.fromDynamic,
      schemaId: ClipRectSchema.id,
    ),
    JsonClipRRectBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonClipRRectBuilder.fromDynamic,
      schemaId: ClipRRectSchema.id,
    ),
    JsonColumnBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonColumnBuilder.fromDynamic,
      schemaId: ColumnSchema.id,
    ),
    JsonConditionalBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonConditionalBuilder.fromDynamic,
      schemaId: ConditionalSchema.id,
    ),
    JsonContainerBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonContainerBuilder.fromDynamic,
      schemaId: ContainerSchema.id,
    ),
    JsonCupertinoSwitchBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonCupertinoSwitchBuilder.fromDynamic,
      schemaId: CupertinoSwitchSchema.id,
    ),
    JsonDecoratedBoxBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonDecoratedBoxBuilder.fromDynamic,
      schemaId: DecoratedBoxSchema.id,
    ),
    JsonDropdownButtonFormFieldBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonDropdownButtonFormFieldBuilder.fromDynamic,
      schemaId: DropdownButtonFormFieldSchema.id,
    ),
    JsonExpandedBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonExpandedBuilder.fromDynamic,
      schemaId: ExpandedSchema.id,
    ),
    JsonFittedBoxBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonFittedBoxBuilder.fromDynamic,
      schemaId: FittedBoxSchema.id,
    ),
    JsonFlatButtonBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonFlatButtonBuilder.fromDynamic,
      schemaId: FlatButtonSchema.id,
    ),
    JsonFlexibleBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonFlexibleBuilder.fromDynamic,
      schemaId: FlexibleSchema.id,
    ),
    JsonFormBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonFormBuilder.fromDynamic,
      schemaId: FormSchema.id,
    ),
    JsonGestureDetectorBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonGestureDetectorBuilder.fromDynamic,
      schemaId: GestureDetectorSchema.id,
    ),
    JsonHeroBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonHeroBuilder.fromDynamic,
      schemaId: HeroSchema.id,
    ),
    JsonIconBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonIconBuilder.fromDynamic,
      schemaId: IconSchema.id,
    ),
    JsonIgnorePointerBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonIgnorePointerBuilder.fromDynamic,
      schemaId: IgnorePointerSchema.id,
    ),
    JsonIndexedStackBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonIndexedStackBuilder.fromDynamic,
      schemaId: IndexedStackSchema.id,
    ),
    JsonInkWellBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonInkWellBuilder.fromDynamic,
      schemaId: InkWellSchema.id,
    ),
    JsonInputErrorBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonInputErrorBuilder.fromDynamic,
      schemaId: InputErrorSchema.id,
    ),
    JsonLinearProgressIndicatorBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonLinearProgressIndicatorBuilder.fromDynamic,
      schemaId: LinearProgressIndicatorSchema.id,
    ),
    JsonListTileBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonListTileBuilder.fromDynamic,
      schemaId: ListTileSchema.id,
    ),
    JsonListViewBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonListViewBuilder.fromDynamic,
      schemaId: ListViewSchema.id,
    ),
    JsonMaterialBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonMaterialBuilder.fromDynamic,
      schemaId: MaterialSchema.id,
    ),
    JsonMemoryImageBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonMemoryImageBuilder.fromDynamic,
      schemaId: MemoryImageSchema.id,
    ),
    JsonNetworkImageBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonNetworkImageBuilder.fromDynamic,
      schemaId: NetworkImageSchema.id,
    ),
    JsonOpacityBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonOpacityBuilder.fromDynamic,
      schemaId: OpacitySchema.id,
    ),
    JsonPaddingBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonPaddingBuilder.fromDynamic,
      schemaId: PaddingSchema.id,
    ),
    JsonPositionedBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonPositionedBuilder.fromDynamic,
      schemaId: PositionedSchema.id,
    ),
    JsonRadioBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonRadioBuilder.fromDynamic,
      schemaId: RadioSchema.id,
    ),
    JsonRaisedButtonBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonRaisedButtonBuilder.fromDynamic,
      schemaId: RaisedButtonSchema.id,
    ),
    JsonRowBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonRowBuilder.fromDynamic,
      schemaId: RowSchema.id,
    ),
    JsonSafeAreaBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSafeAreaBuilder.fromDynamic,
      schemaId: SafeAreaSchema.id,
    ),
    JsonSaveContextBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSaveContextBuilder.fromDynamic,
      schemaId: SaveContextSchema.id,
    ),
    JsonScaffoldBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonScaffoldBuilder.fromDynamic,
      schemaId: ScaffoldSchema.id,
    ),
    JsonSetValueBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSetValueBuilder.fromDynamic,
      schemaId: SetValueSchema.id,
    ),
    JsonSetWidgetBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSetWidgetBuilder.fromDynamic,
      schemaId: SetWidgetSchema.id,
    ),
    JsonSingleChildScrollViewBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSingleChildScrollViewBuilder.fromDynamic,
      schemaId: SingleChildScrollViewSchema.id,
    ),
    JsonSizedBoxBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSizedBoxBuilder.fromDynamic,
      schemaId: SizedBoxSchema.id,
    ),
    JsonStackBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonStackBuilder.fromDynamic,
      schemaId: StackSchema.id,
    ),
    JsonSwitchBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonSwitchBuilder.fromDynamic,
      schemaId: SwitchSchema.id,
    ),
    JsonTextBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonTextBuilder.fromDynamic,
      schemaId: TextSchema.id,
    ),
    JsonTextFormFieldBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonTextFormFieldBuilder.fromDynamic,
      schemaId: TextFormFieldSchema.id,
    ),
    JsonThemeBuilder.type: JsonWidgetBuilderContainer(
      builder: JsonThemeBuilder.fromDynamic,
      schemaId: ThemeSchema.id,
    ),
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
    fun_key_remove_value: ({
      @required List<dynamic> args,
      @required JsonWidgetRegistry registry,
    }) =>
        () => registry.removeValue(
              args[0],
            ),
    fun_key_set_value: ({
      @required List<dynamic> args,
      @required JsonWidgetRegistry registry,
    }) =>
        () => registry.setValue(
              args[0],
              args[1],
            ),
  };
  final _internalValues = <String, dynamic>{}..addAll(
      CurvesValues.translation,
    );
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

  /// Removes all variable values from the registry
  void clearValues() {
    var keys = Set<String>.from(_values.keys);
    _values.clear();

    keys.forEach((element) => _valueStreamController?.add(element));
  }

  /// Disposes the registry.
  void dispose() {
    _valueStreamController?.close();
    _valueStreamController = null;
  }

  /// Executes the dynamic function named [key].  This will first check  for a
  /// custom dynamic function using the [key], and if none is found, this will
  /// then check the internal functions.  If no function can be found in either
  /// collection, this will throw an [Exception].
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

  /// Returns the variable value for the given [key].This will first check for
  /// a custom dynamic value using the [key], and if none is found, this will
  /// then check the internal values. If a variable with named [key] cannot be
  /// found, this will return [null].
  dynamic getValue(String key) => _values[key] ?? _internalValues[key];

  /// Returns the builder for the requested [type].  This will first search the
  /// registered custom builders, then if no builder is found, this will then
  /// search the library provided builders.
  ///
  /// If no builder is registered for the given [type] then this will throw an
  /// [Exception].
  JsonWidgetBuilderBuilder getWidgetBuilder(String type) {
    assert(type != null);

    var container = _customBuilders[type] ?? _internalBuilders[type];
    var builder = container.builder;

    if (builder == null) {
      throw Exception('Builder requested for unknown type: $type');
    }

    return builder;
  }

  /// Processes any dynamic argument values from [args].  This will return a
  /// metadata object with the results as well as a collection of dynamic
  /// variable names that were encounted.
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
  ///
  /// If the [container] has an associated schema id then in DEBUG builds, that
  /// schema will be used to validate the attributes sent to the builder.
  void registerCustomBuilder(
    String type,
    JsonWidgetBuilderContainer container,
  ) {
    assert(type != null);
    assert(container != null);

    _customBuilders[type] = container;
  }

  /// Registers the custom builders.  This is a convenience method that calls
  /// [registerCustomBuilder] for each entry in [containers].
  void registerCustomBuilders(
    Map<String, JsonWidgetBuilderContainer> containers,
  ) =>
      containers?.forEach((key, value) => registerCustomBuilder(key, value));

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

  /// Removes the [key] from the registry.
  ///
  /// If, and only if, the [key] was registered on the registry will this fire
  /// an event on the [valueStream] with the [key] so listeners can be notified
  /// that the value has changed.
  dynamic removeValue(String key) {
    assert(key?.isNotEmpty == true);

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
  JsonWidgetBuilderContainer unregisterCustomBuilder(String type) {
    assert(type != null);

    return _customBuilders.remove(type);
  }

  JsonWidgetFunction unregisterFunction(String key) {
    assert(key?.isNotEmpty == true);

    return _functions.remove(key);
  }

  /// Validates the builder against it's value.  This will only perform a
  /// validation if a schema id is associated with builder.
  ///
  /// Because the validation is relatively expensive, the validation will only
  /// happen in DEBUG builds.  It is disabled in RELEASE builds.  In RELEASE
  /// builds this will always return [true].
  bool validateBuilderSchema({
    @required String type,
    @required dynamic value,
    bool validate = true,
  }) {
    var result = true;

    assert(() {
      if (disableValidation != true) {
        var container = _customBuilders[type] ?? _internalBuilders[type];
        if (container?.schemaId != null) {
          result = SchemaValidator().validate(
            schemaId: container.schemaId,
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
