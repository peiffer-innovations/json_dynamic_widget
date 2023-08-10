// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:json_class/json_class.dart';
import 'package:meta/meta.dart';
import 'package:template_expressions/expressions.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:yaon/yaon.dart';

void main(List<String> args) {
  var path = args.isEmpty ? null : args[0];

  assert(() {
    path = 'example/assets';

    return true;
  }());

  if (path == null) {
    print('''
Usage:
  dart pub global run json_dynamic_widget:migrate [path]

''');
    exit(1);
  }

  final dir = Directory(path!);
  print('''
Attempting to migrate the files found in:
  - ${dir.absolute.path}
''');

  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((e) => e.path.endsWith('.json') || e.path.endsWith('.yaml'));

  var error = false;
  for (var file in files) {
    try {
      final isYaml = file.path.endsWith('.yaml');
      final content = file.readAsStringSync();

      // It's ugly, but this guarantees all the collections are modifiable, even
      // YAML ones.
      final data = _JsonWidgetData.fromDynamic(
        yaon.parse(
          content,
          normalize: true,
        ),
      ).toJson();

      final output = File('${file.path}.bak');
      if (!output.existsSync()) {
        output.createSync(recursive: true);
      }
      output.writeAsStringSync(content);
      if (isYaml) {
        file.writeAsStringSync(
          YAMLWriter(
            allowUnquotedStrings: true,
            indentSize: 2,
          ).convert(data),
        );
      } else {
        file.writeAsStringSync(
          const JsonEncoder.withIndent('  ').convert(data),
        );
      }
      print('[migrated]: ${file.path}');
    } catch (e, stack) {
      error = true;
      print('''
Error migrating JSON file: [${file.path}]

$e
$stack
''');
    }
  }

  if (error) {
    exit(1);
  }

  exit(0);
}

class _JsonWidgetData extends JsonClass {
  _JsonWidgetData({
    this.args,
    this.child,
    this.children,
    this.listenVariables,
    this.id,
    required this.type,
  });

  final dynamic args;
  final dynamic child;
  final dynamic children;
  final List<String>? listenVariables;
  final String? id;
  final String type;

  static _JsonWidgetData fromDynamic(dynamic map) {
    final child = map['child'];
    final children = map['children'];

    try {
      return _JsonWidgetData(
        args: map['args'],
        child: map['child'] == null
            ? null
            : child is String
                ? child
                : _JsonWidgetData.fromDynamic(map['child']),
        children: children == null
            ? null
            : children is String
                ? children
                : JsonClass.fromDynamicList(
                    map['children'],
                    _JsonWidgetData.fromDynamic,
                  ),
        listenVariables:
            map['listen'] == null ? null : List<String>.from(map['listen']),
        id: map['id'],
        type: map['type'].toString(),
      );
    } catch (e, stack) {
      print('''
$map

$e
$stack
''');
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    var args = this.args ?? const <String, dynamic>{};
    if (args is Map) {
      args = args.map((key, value) {
        var result = value;

        if (result is Map &&
            result.containsKey('type') &&
            (result.containsKey('child') ||
                result.containsKey('children') ||
                result.containsKey('args'))) {
          result = _JsonWidgetData.fromDynamic(result).toJson();
        }

        return MapEntry(key, result);
      });
    }

    final childData = child is _JsonWidgetData ? child.toJson() : child;
    final childrenData = children == null
        ? null
        : children is String
            ? children
            : JsonClass.maybeToJsonList(children);
    final result = (type != 'set_value' &&
            type != 'set_widget' &&
            args is String)
        ? args
        : <String, dynamic>{
            if (type != 'set_value' && type != 'set_widget' && args is Map)
              ...args,
            if (type == 'set_value' && args is String) 'values': {args},
            if (type == 'set_value' && args is Map) 'values': {...args},
            if (type == 'set_widget' && args is String) 'widgets': {args},
            if (type == 'set_widget' && args is Map) 'widgets': {...args},
            if (child != null && type != 'scaffold' && type != 'conditional')
              'child': childData,
            if (child != null && type == 'conditional') 'onTrue': childData,
            if (child != null && type == 'scaffold') 'body': childData,
            if (children != null && type != 'animated_cross_fade')
              'children': childrenData,
            if (children != null && type == 'animated_cross_fade') ...{
              'firstChild': (children as List)[0].toJson(),
              'secondChild': (children as List)[1].toJson(),
            },
          };

    final listen = <String>{
      if (listenVariables != null) ...listenVariables!,
    };
    final processed = ArgProcessors.process(result, null);
    listen.addAll(processed.listenVariables);

    return JsonClass.removeNull({
      'type': type,
      if (id != null) 'id': id,
      if (listen.isNotEmpty) 'listen': List<String>.from(listen),
      'args': result,
    });
  }
}

/// Arg processor allows to process [JsonWidgetData] arg into its real value.
/// It also is responsible to calculate (or not) variable names that specified
/// [JsonWidgetData] depends on. It produces [ProcessedArg] which contains all
/// that infomations.
///
/// Implementation of that interface is giving the possibility to extend the
/// syntax about custom one.
abstract class ArgProcessor {
  /// Used to give the information if specified [arg]
  /// is supported by [ArgProcessor].
  bool support(dynamic arg);

  /// Process passed [arg] into [ProcessedArg].
  /// The [registry] is giving functions and variables information context for
  /// the processing.
  ///
  /// Passed [listenVariables] is the information about variables that
  /// [JsonWidgetData] depends on. Passing that should be make the
  /// [ArgProcessor] to stop calculating these variable names. It is
  /// treated as a optimization.
  ///
  /// [ProcessedArg] contains info about [arg] real value and variable names
  /// that it depends on.
  ProcessedArg process(
    dynamic arg,
    Set<String>? listenVariables,
  );
}

/// List of predifinied [ArgProcessor]s.
class ArgProcessors {
  /// Default list of processors used by [JsonWidgetRegistry] to process args.
  static final List<ArgProcessor> defaults = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    RawArgProcessor(),
  ];

  static ProcessedArg process(dynamic args, Set<String>? listenVariables) =>
      defaults
          .firstWhere(
            (parser) => parser.support(args),
            orElse: () => RawArgProcessor(),
          )
          .process(args, listenVariables);
}

/// Processor that integrates https://pub.dev/packages/expressions library
/// syntax with [JsonWidgetRegistry] variables and functions.  All expressions
/// should be placed in ${.*} syntax.
///
/// A few examples:
/// * `${var1}` - find the value of 'var1' variable inside of [JsonWidgetRegistry]
/// and return ['var1'] it's name as the listen variable names.
/// * `${print('var1 value is: ' + var1)}` - executes 'print' function from
/// [JsonWidgetRegistry]. As the arg for that function it takes contatenation
/// of 'var1 value is: ' string and the value of 'var1'.
///
/// Listen variable names for such a expression is ['var1'].
class ExpressionArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'^\${\s*(.*?)\s*}$');
  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  @override
  ProcessedArg process(
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    var resultListenVariables = listenVariables ?? <String>{};

    final regexpMatch = _matchRegexp.firstMatch(arg.toString())!;
    final expression = Expression.tryParse(regexpMatch.group(1)!);
    if (expression != null) {
      final evaluator = ArgsExpressionEvaluator(true);
      arg = evaluator.evaluate(expression);
      resultListenVariables = evaluator.listenVariables;
    }
    return ProcessedArg(
      listenVariables: resultListenVariables,
      value: arg,
    );
  }
}

/// Modification added to [ExpressionEvaluator] which integrates
/// [JsonWidgetRegistry] variables and functions.
class ArgsExpressionEvaluator extends ExpressionEvaluator {
  ArgsExpressionEvaluator(
    this.calculateListenVariables,
  );

  final bool calculateListenVariables;

  final Set<String> _listenVariables = {};

  Set<String> get listenVariables => _listenVariables;

  dynamic evaluate(Expression expression) => super.eval(expression, {});

  @override
  dynamic evalVariable(
    Variable variable,
    Map<String, dynamic> context,
  ) {
    final variableName = variable.identifier.name;
    return super.evalVariable(
      variable,
      _updateContextIfNeeded(
        context,
        variableName,
      ),
    );
  }

  @override
  dynamic evalMemberExpression(
    MemberExpression expression,
    Map<String, dynamic> context, {
    bool nullable = false,
  }) {
    final variableName = '${expression.object}.${expression.property}';
    return evalVariable(Variable(Identifier(variableName)), context);
  }

  @override
  dynamic evalIndexExpression(
    IndexExpression expression,
    Map<String, dynamic> context, {
    bool nullable = false,
  }) {
    dynamic objectIndexValue;
    final objectValue = eval(expression.object, context);
    if (objectValue != null) {
      objectIndexValue =
          eval(expression.object, context)[eval(expression.index, context)];
    }
    return objectIndexValue;
  }

  @override
  dynamic evalCallExpression(
      CallExpression expression, Map<String, dynamic> context) {
    // no-op
  }

  Map<String, dynamic> _updateContextIfNeeded(
    Map<String, dynamic> context,
    String variableName,
  ) {
    if (!context.containsKey(variableName)) {
      _listenVariables.add(variableName);
    }
    return context;
  }
}

/// Processor for iterable [arg].  The processor is processing every value of
/// the [arg] using [JsonWidgetRegistry] processsors and it is aggregating all
/// listen variable names. In case of passing [listenVariables] directly then
/// the aggregation step is skipped.
class IterableArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) => arg != null && arg is Iterable;

  @override
  ProcessedArg process(
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    final calculateListenVariables = listenVariables == null;
    final resultListenVariables = listenVariables ?? <String>{};

    final iterableArg = arg as Iterable;
    final processedArgs = [];
    for (var arg in iterableArg) {
      final processedArg = ArgProcessors.process(arg, listenVariables);
      processedArgs.add(processedArg.value);

      if (calculateListenVariables) {
        resultListenVariables.addAll(processedArg.listenVariables.toList());
      }
    }
    return ProcessedArg(
      value: processedArgs,
      listenVariables: resultListenVariables,
    );
  }
}

/// Processor for map [arg]. It is entry point for [JsonWidgetData] args.
/// If the [arg] is detected to be [JsonWidgetData] then processing of such
/// an [arg] is skipped.
///
/// The processor is processing every key/value of the [arg] using
/// [JsonWidgetRegistry] processsors and it is aggregating all
/// listen variable names. In case of passing [listenVariables] directly
/// then the aggregation step is skipped.
class MapArgProcessor implements ArgProcessor {
  /// Processors used to resolve map key. For map value the [JsonWidgetRegistry]
  /// one are used.
  final List<ArgProcessor> _keyProcessors = [
    ExpressionArgProcessor(),
    RawArgProcessor()
  ];

  @override
  bool support(dynamic arg) => arg != null && arg is Map;

  @override
  ProcessedArg process(
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    final mapArg = arg as Map;
    final calculateListenVariables = listenVariables == null;
    final resultListenVariables = listenVariables ?? <String>{};
    final processedMapArg = {};

    if (_isJsonWidgetData(mapArg)) {
      // The entry has a "type" and one of: "child", "children", "args".  This
      // means the item is most likely a JsonWidgetData class, so we should
      // not process the args yet.  We should wait until the actual
      // JsonWidgetData gets built.
      return ProcessedArg(value: arg, listenVariables: resultListenVariables);
    }

    for (var key in mapArg.keys) {
      final processedKeyArg = _processKey(key, listenVariables);
      final processedValueArg =
          ArgProcessors.process(mapArg[key], listenVariables);
      processedMapArg[processedKeyArg.value] = processedValueArg.value;
      if (calculateListenVariables) {
        resultListenVariables.addAll(processedKeyArg.listenVariables.toList());
        resultListenVariables.addAll(
          processedValueArg.listenVariables.toList(),
        );
      }
    }
    return ProcessedArg(
      value: processedMapArg,
      listenVariables: resultListenVariables,
    );
  }

  ProcessedArg _processKey(
    String key,
    Set<String>? listenVariables,
  ) {
    return _keyProcessors
        .firstWhere(
          (parser) => parser.support(key),
          orElse: () => RawArgProcessor(),
        )
        .process(key, listenVariables);
  }

  bool _isJsonWidgetData(Map mapArg) {
    return mapArg['type'] != null && mapArg['args'] != null;
  }
}

/// Processor which is accepting any [arg] and not process [arg] value at all.
/// That processor should be used as the last processor in the pipeline.
class RawArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return true;
  }

  @override
  ProcessedArg process(
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    final resultListenVariables = listenVariables ?? <String>{};
    return ProcessedArg(
      listenVariables: resultListenVariables,
      value: arg,
    );
  }
}

@immutable
class ProcessedArg {
  const ProcessedArg({
    required this.listenVariables,
    required this.value,
  });

  final Set<String> listenVariables;
  final dynamic value;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is ProcessedArg) {
      result = true;
      result = result &&
          listenVariables.toString() == other.listenVariables.toString();
      result = result && value?.toString() == other.value?.toString();
    }

    return result;
  }

  @override
  int get hashCode =>
      (31 * (listenVariables.hashCode)) * (value?.hashCode ?? 0);

  @override
  String toString() => 'ProcessedArg({$listenVariables}, {$value})';
}
