// ignore_for_file: avoid_print

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:json_dynamic_widget_codegen/json_dynamic_widget_codegen.dart';
import 'package:json_dynamic_widget_codegen/src/encoder/encoders.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';
import 'package:yaon/yaon.dart';

class JsonWidgetLibraryBuilder extends GeneratorForAnnotation<JsonWidget> {
  static const kChildNames = <String>{'child', 'children'};

  bool _isDebugMode = false;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    assert(() {
      _isDebugMode = true;
      return true;
    }());

    var builderCode = '';
    var jsonWidgetCode = '';
    var modelCode = '';
    var schemaCode = '';
    String? widgetName;

    try {
      var constBuilder = false;
      final autoRegister = annotation.read('autoRegister').boolValue;
      final requiresId = annotation.read('requiresId').boolValue;
      String? jsonWidgetName;
      String? typeName;

      try {
        jsonWidgetName = annotation.read('jsonWidget').stringValue;
      } catch (_) {
        // no-op; use the default name
      }
      try {
        typeName = annotation.read('type').stringValue;
      } catch (_) {
        // no-op; use the default name
      }
      try {
        widgetName = annotation.read('widget').stringValue;
      } catch (_) {
        // no-op; use the default name
      }
      final pubspec = yaon.parse(File('pubspec.yaml').readAsStringSync());
      final packageName = pubspec['name'].toString();
      final schemaBaseUrl =
          pubspec['schema_url'] ??
          'https://peiffer-innovations.github.io/flutter_json_schemas/schemas';
      final name = element.name;
      if (name == null) {
        throw Exception(
          'Annotation found on unnamed location, cannot continue.',
        );
      }
      if (!name.startsWith('_')) {
        throw Exception('Class must be private, but [$name] is not private.');
      }

      if (element is! ClassElement) {
        throw Exception('Annotation found but is not associated with a class.');
      }

      final positionedParams = <String>[];
      MethodElement? method;
      const aliasChecker = TypeChecker.typeNamed(JsonArgAlias);
      const builderParamChecker = TypeChecker.typeNamed(JsonBuildArg);
      const builderChecker = TypeChecker.typeNamed(JsonBuilder);
      const defaultChecker = TypeChecker.typeNamed(JsonDefaultParam);
      const positionedChecker = TypeChecker.typeNamed(JsonPositionedParam);
      const schemaNameChecker = TypeChecker.typeNamed(JsonSchemaName);

      var conHasRegistry = false;

      ConstructorElement? eCon;
      for (var c in element.constructors) {
        if (!c.isFactory && !c.displayName.contains('.')) {
          eCon = c;
          for (var p in c.formalParameters) {
            if (p.name == 'registry') {
              conHasRegistry = true;
            }
          }
        }
      }
      if (eCon == null) {
        throw Exception('Unable to locate a default constructor.');
      }

      final methodsList = <MethodElement>[];
      methodsList.addAll(element.methods);
      List<MethodElement> interfaceVisitor(List<InterfaceType> interfaces) {
        final list = <MethodElement>[];
        for (final interface in interfaces) {
          list.addAll(interface.methods);
          list.addAll(interfaceVisitor(interface.interfaces));
        }
        return list;
      }

      for (final mixin in element.mixins) {
        methodsList.addAll(mixin.methods);
        methodsList.addAll(interfaceVisitor(mixin.interfaces));
      }

      for (var m in methodsList) {
        final annotation = builderChecker.firstAnnotationOf(m);
        if (annotation != null) {
          method = m;
          break;
        }
      }
      if (method == null) {
        for (var m in methodsList) {
          if (m.name == 'buildCustom') {
            method = m;
            break;
          }
        }
      }

      if (method == null) {
        throw Exception('No [buildCustom] or [_buildCustom] function found.');
      }

      String? schemaName;
      final schemaNameAnnotation = schemaNameChecker.firstAnnotationOf(method);
      if (schemaNameAnnotation != null) {
        schemaName = ConstantReader(
          schemaNameAnnotation,
        ).read('name').stringValue;
      }

      final positionedAnnotations = positionedChecker.annotationsOf(method);
      for (var annotation in positionedAnnotations) {
        final name = ConstantReader(annotation).read('name').stringValue;
        positionedParams.add(name);
      }

      final paramDefaults = <String, String>{};
      final defaultAnnotations = defaultChecker.annotationsOf(method);
      for (var annotation in defaultAnnotations) {
        final name = ConstantReader(annotation).read('name').stringValue;
        final code = ConstantReader(annotation).read('code').stringValue;
        paramDefaults[name] = code;
      }

      final aliasAnnotations = aliasChecker.annotationsOf(method);
      final aliases = <String, String>{};
      for (var annotation in aliasAnnotations) {
        final name = ConstantReader(annotation).read('name').stringValue;
        final alias = ConstantReader(annotation).read('alias').stringValue;
        aliases[name] = alias;
      }

      final paramDecoders = <String, MethodElement>{};
      final paramEncoders = <String, MethodElement>{};
      final schemaDecoders = <String, MethodElement>{};
      const paramEncoderChecker = TypeChecker.typeNamed(JsonArgEncoder);
      const paramDecoderChecker = TypeChecker.typeNamed(JsonArgDecoder);
      const paramSchemaChecker = TypeChecker.typeNamed(JsonArgSchema);
      for (var m in methodsList) {
        final paramEncoderAnnotation = paramEncoderChecker.firstAnnotationOf(m);
        final paramDecoderAnnotation = paramDecoderChecker.firstAnnotationOf(m);
        final schemaAnnotation = paramSchemaChecker.firstAnnotationOf(m);
        if (paramDecoderAnnotation != null) {
          final param = ConstantReader(
            paramDecoderAnnotation,
          ).read('param').stringValue;
          paramDecoders[param] = m;
        }
        if (paramEncoderAnnotation != null) {
          final param = ConstantReader(
            paramEncoderAnnotation,
          ).read('param').stringValue;
          paramEncoders[param] = m;
        }

        if (schemaAnnotation != null) {
          if (!m.isStatic) {
            throw Exception(
              'Encountered [JsonArgSchema] annotation on a non-static method named: [${m.displayName}].',
            );
          }
          final param = ConstantReader(
            schemaAnnotation,
          ).read('param').stringValue;
          schemaDecoders[param] = m;
        }
      }

      final widget = method.returnType;
      if (widget is! InterfaceType) {
        throw Exception(
          'Unknown type [${widget.runtimeType}] found on the return from [buildCustom].',
        );
      }
      final widgetElement = widget.element;
      if (widgetElement is! ClassElement) {
        throw Exception(
          'Unknown type [${widgetElement.runtimeType}] found on the return from [buildCustom].',
        );
      }

      final widgetFieldDocs = <String, String>{};
      for (var f in widgetElement.fields) {
        final docs = f.documentationComment;

        if (docs != null) {
          widgetFieldDocs[f.displayName] = docs;
        }
      }

      widgetName ??= _withoutNullability(widget.getDisplayString());
      widgetName = widgetName.replaceAll(RegExp(r'\<.*\>'), '');
      jsonWidgetName ??=
          'Json${widgetName.startsWith('_') ? widgetName.substring(1) : widgetName}';

      ConstructorElement? wCon;
      for (var c in widget.constructors) {
        if (!c.isFactory && !c.displayName.contains('.')) {
          wCon = c;
        }
      }

      if (wCon == null) {
        throw Exception(
          'Cannot find unnamed constructor in [${_withoutNullability(widget.getDisplayString())}]',
        );
      }

      final wConstructor = wCon;

      final formelParams = wConstructor.formalParameters;

      final params = <Param>[];
      for (var p in formelParams) {
        params.add(
          Param.fromFormalParameter(
            p,
            builderParamChecker: builderParamChecker,
          ),
        );
      }
      final generated = Class(
        (c) => _generateClass(
          c,
          aliases: aliases,
          conHasRegistry: conHasRegistry,
          constBuilder: (c) => constBuilder = c,
          eCon: eCon,
          method: method,
          name: name,
          paramDecoders: paramDecoders,
          params: params,
          positionedParams: positionedParams,
          requiresId: requiresId,
          typeName: typeName,
          widget: widget,
          widgetName: widgetName!,
        ),
      );

      final emitter = DartEmitter(useNullSafetySyntax: true);
      builderCode = generated.accept(emitter).toString();

      final jsonWidget = Class(
        (c) => _generateWidgetClass(
          c,
          aliases: aliases,
          name: name,
          jsonWidgetName: jsonWidgetName!,
          paramDecoders: paramDecoders,
          paramDefaults: paramDefaults,
          params: params,
          positionedParams: positionedParams,
          widget: widget,
          widgetFieldDocs: widgetFieldDocs,
        ),
      );
      jsonWidgetCode = jsonWidget.accept(emitter).toString();

      final model = Class(
        (c) => _generateModel(
          c,
          aliases: aliases,
          element: element,
          name: name,
          paramDecoders: paramDecoders,
          paramDefaults: paramDefaults,
          paramEncoders: paramEncoders,
          params: params,
          wConstructor: wConstructor,
          widget: widget,
          widgetFieldDocs: widgetFieldDocs,
        ),
      );

      modelCode = model.accept(emitter).toString();

      final schema = Class(
        (c) => _generateSchema(
          c,
          aliases: aliases,
          packageName: packageName,
          params: params,
          schemaBaseUrl: schemaBaseUrl,
          schemaDecoders: schemaDecoders,
          schemaName: schemaName,
          schemaNameCallback: (s) => schemaName = s,
          widgetName: widgetName!,
        ),
      );

      schemaCode = schema.accept(emitter).toString();

      if (schemaName == null) {
        throw Exception('Unexpected error, [schemaName] is null.');
      }

      WidgetMetadata.instance.add(
        autoRegister: autoRegister,
        builder: name.substring(1),
        constBuilder: constBuilder,
        schema: schemaName!,
        widget: widgetName,
      );

      return _prepareCode(
        builderCode: builderCode,
        jsonWidgetCode: jsonWidgetCode,
        modelCode: modelCode,
        schemaCode: schemaCode,
        widgetName: widgetName,
      );
    } catch (e, stack) {
      print('$e\n$stack\n');

      if (!_isDebugMode) {
        rethrow;
      }

      return '''
/*

${_prepareCode(builderCode: builderCode, jsonWidgetCode: jsonWidgetCode, modelCode: modelCode, schemaCode: schemaCode, widgetName: widgetName)}

*/

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

/*

$e
$stack

*/
''';
    }
  }

  void _generateClass(
    ClassBuilder c, {
    required Map<String, String> aliases,
    required bool conHasRegistry,
    required void Function(bool) constBuilder,
    required ConstructorElement? eCon,
    required MethodElement? method,
    required String name,
    required Map<String, MethodElement> paramDecoders,
    required List<Param> params,
    required List<String> positionedParams,
    required bool requiresId,
    required String? typeName,
    required InterfaceType widget,
    required String widgetName,
  }) {
    final typeStr =
        typeName ??
        ReCase(widgetName).snakeCase.replaceAll(RegExp(r'\<.*\>'), '');
    c.name = name.substring(1);
    c.extend = Reference(name);
    params.sort((a, b) {
      var result = a.displayName.compareTo(b.displayName);

      if (kChildNames.contains(a.displayName)) {
        if (!kChildNames.contains(b.displayName)) {
          result = 1;
        }
      }
      if (kChildNames.contains(b.displayName)) {
        if (!kChildNames.contains(a.displayName)) {
          result = -1;
        }
      }

      return result;
    });

    c.fields.add(
      Field((f) {
        f.name = 'kType';
        f.static = true;
        f.modifier = FieldModifier.constant;
        f.assignment = Code("'$typeStr'");
      }),
    );

    c.constructors.add(
      Constructor((con) {
        con.constant = eCon != null && eCon.isConst;
        constBuilder(con.constant);

        con.optionalParameters.add(
          Parameter((param) {
            param.name = 'args';
            param.named = true;
            param.required = true;
            param.toSuper = true;
          }),
        );

        if (conHasRegistry) {
          con.optionalParameters.add(
            Parameter((param) {
              param.name = 'registry';
              param.named = true;
              param.required = true;
              param.toSuper = true;
            }),
          );
        }
      }),
    );

    c.methods.add(
      Method((m) {
        m.docs.add('''
  /// Constant that can be referenced for the builder's type.''');
        m.name = 'type';
        m.annotations.add(const CodeExpression(Code('override')));
        m.lambda = true;
        m.type = MethodType.getter;
        m.returns = const Reference('String');
        m.body = const Code('kType');
      }),
    );

    c.methods.add(
      Method((m) {
        m.docs.add('''
  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.''');
        m.name = 'fromDynamic';
        m.static = true;
        m.requiredParameters.add(
          Parameter((p) {
            p.name = 'map';
            p.type = const Reference('dynamic');
          }),
        );
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'registry';
            p.type = const Reference('JsonWidgetRegistry?');
            p.named = true;
            p.required = false;
          }),
        );

        m.returns = Reference(c.name);
        m.lambda = true;

        m.body = Code('''
${c.name}(
  args: map,
  ${conHasRegistry ? 'registry: registry,' : ''}
)

''');
      }),
    );

    c.methods.add(
      Method((m) {
        m.name = 'createModel';
        m.annotations.add(const CodeExpression(Code('override')));
        m.returns = Reference('${name.substring(1)}Model');
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'childBuilder';
            p.named = true;
            p.required = false;
            p.type = const Reference('ChildWidgetBuilder?');
          }),
        );
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'data';
            p.named = true;
            p.required = true;
            p.type = const Reference('JsonWidgetData');
          }),
        );

        final idBuf = StringBuffer();
        if (requiresId) {
          assert(false, '');
          idBuf.writeln("""
assert(data.hasProvidedId, '''
The $typeStr requires an id to be provided within the JSON but no provided
id was found.  This may lead to errors or unexpected results when running in
release mode.
''');
""");
        }

        m.body = Code('''
$idBuf
final model = ${c.name}Model.fromDynamic(
  args,
  registry: data.jsonWidgetRegistry,
);

return model;
''');
      }),
    );

    c.methods.add(
      Method((m) {
        m.name = method!.name;
        m.annotations.add(const CodeExpression(Code('override')));
        m.returns = Reference(widget.getDisplayString());

        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'childBuilder';
            p.named = true;
            p.required = false;
            p.type = const Reference('ChildWidgetBuilder?');
          }),
        );
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'context';
            p.named = true;
            p.required = true;
            p.type = const Reference('BuildContext');
          }),
        );
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'data';
            p.named = true;
            p.required = true;
            p.type = const Reference('JsonWidgetData');
          }),
        );
        m.optionalParameters.add(
          Parameter((p) {
            p.name = 'key';
            p.named = true;
            p.required = false;
            p.type = const Reference('Key?');
          }),
        );

        final lines = <String>[];
        final buf = StringBuffer();
        for (var pos in positionedParams) {
          _buildCustomParamBuilder(
            aliases: aliases,
            buf: buf,
            positioned: true,
            lines: lines,
            param: params.firstWhere((p) => p.displayName == pos),
            paramDecoders: paramDecoders,
            positionedParams: positionedParams,
          );
        }
        for (var param in params) {
          if (!positionedParams.contains(param.displayName)) {
            _buildCustomParamBuilder(
              aliases: aliases,
              buf: buf,
              positioned: false,
              lines: lines,
              param: param,
              paramDecoders: paramDecoders,
              positionedParams: positionedParams,
            );
          }
        }

        m.body = Code('''
final model = createModel(
  childBuilder: childBuilder,
  data: data, 
);

${buf.toString()}
return ${_withoutNullability(widget.getDisplayString())}(
  ${lines.join(',')}${lines.isNotEmpty ? ',' : ''}
);
''');
      }),
    );
  }

  void _generateWidgetClass(
    ClassBuilder c, {
    required Map<String, String> aliases,
    required String name,
    required String jsonWidgetName,
    required Map<String, MethodElement> paramDecoders,
    required Map<String, String> paramDefaults,
    required List<Param> params,
    required List<String>? positionedParams,
    required InterfaceType widget,
    required Map<String, String> widgetFieldDocs,
  }) {
    try {
      c.name = jsonWidgetName;
      c.extend = const Reference('JsonWidgetData');
      c.constructors.add(
        Constructor((con) {
          con.optionalParameters.add(
            Parameter((p) {
              p.name = 'args';
              p.required = false;
              p.named = true;
              p.type = const Reference('Map<String, dynamic>');
              p.defaultTo = const Code('const {}');
            }),
          );
          con.optionalParameters.add(
            Parameter((p) {
              p.name = 'registry';
              p.required = false;
              p.named = true;
              p.type = const Reference('JsonWidgetRegistry?');
            }),
          );
          _buildConstructorParams(
            aliases: aliases,
            con: con,
            paramDecoders: paramDecoders,
            paramDefaults: paramDefaults,
            params: params,
            positionedParams: positionedParams,
          );

          con.lambda = true;

          final modelLines = StringBuffer();

          for (var p in params) {
            if (!p.isBuilderParam && p.displayName != 'key') {
              modelLines.writeln(
                "'${aliases[p.displayName] ?? p.displayName}': ${p.displayName},",
              );
            }
          }

          con.initializers.add(
            Code('''
super(
  jsonWidgetArgs: ${name.substring(1)}Model.fromDynamic({
      $modelLines
      ...args,    
    },
    args: args,
    registry: registry,
  ),
  jsonWidgetBuilder: () => ${name.substring(1)}(
    args: ${name.substring(1)}Model.fromDynamic({
        $modelLines
        ...args,
      },
      args: args,
      registry: registry,
    ),
  ),
  jsonWidgetType: ${name.substring(1)}.kType,
)
'''),
          );
        }),
      );

      _buildClassFields(
        aliases: aliases,
        c: c,
        paramDecoders: paramDecoders,
        params: params,
        widget: widget,
        widgetFieldDocs: widgetFieldDocs,
      );

      //       c.methods.add(Method((m) {
      //         m.annotations.add(const CodeExpression(Code('override')));
      //         m.name = 'build';
      //         m.returns = const Reference('Widget');
      //         m.requiredParameters.add(Parameter((p) {
      //           p.type = const Reference('BuildContext');
      //           p.name = 'context';
      //         }));

      //         m.lambda = true;

      //         final modelLines = StringBuffer();

      //         for (var p in params) {
      //           final annotation = builderParamChecker.firstAnnotationOf(p);
      //           if (annotation == null && p.name != 'key') {
      //             modelLines.writeln('${p.name}: ${p.name},');
      //           }
      //         }

      //         m.body = Code('''
      // ${name.substring(1)}.fromModel(model: ${name.substring(1)}Model(
      // $modelLines
      //         ),).build(context: context,)
      //         ''');
      //       }));
    } catch (e, stack) {
      print('$e\n$stack\n');
    }
  }

  void _generateModel(
    ClassBuilder c, {
    required Map<String, String> aliases,
    required ClassElement element,
    required String name,
    required Map<String, MethodElement> paramDecoders,
    required Map<String, String> paramDefaults,
    required Map<String, MethodElement> paramEncoders,
    required List<Param> params,
    required ConstructorElement wConstructor,
    required InterfaceType widget,
    required Map<String, String> widgetFieldDocs,
  }) {
    try {
      final docs = wConstructor.documentationComment;
      if (docs != null) {
        c.docs.add(
          '  /* AUTOGENERATED FROM [${_withoutNullability(widget.getDisplayString())}]*/',
        );
        c.docs.add(docs);
      }
      c.name = '${name.substring(1)}Model';
      c.extend = const Reference('JsonWidgetBuilderModel');
      c.constructors.add(
        Constructor((con) {
          con.constant = true;

          con.requiredParameters.add(
            Parameter((p) {
              p.name = 'args';
              p.named = false;
              p.toSuper = true;
            }),
          );

          _buildConstructorParams(
            aliases: aliases,
            con: con,
            paramDecoders: paramDecoders,
            paramDefaults: paramDefaults,
            params: params,
          );
        }),
      );

      _buildClassFields(
        aliases: aliases,
        c: c,
        paramDecoders: paramDecoders,
        params: params,
        widget: widget,
        widgetFieldDocs: widgetFieldDocs,
      );

      c.methods.add(
        Method((m) {
          m.static = true;
          m.returns = Reference(c.name);
          m.name = 'fromDynamic';
          m.requiredParameters.add(
            Parameter((p) {
              p.name = 'map';
              p.type = const Reference('dynamic');
              p.named = false;
            }),
          );
          m.optionalParameters.add(
            Parameter((p) {
              p.name = 'args';
              p.type = const Reference('Map<String, dynamic>');
              p.defaultTo = const Code('const {}');
              p.named = true;
            }),
          );
          m.optionalParameters.add(
            Parameter((p) {
              p.name = 'registry';
              p.type = const Reference('JsonWidgetRegistry?');
              p.named = true;
            }),
          );
          m.body = Code('''
final result = maybeFromDynamic(map, args: args, registry: registry,);

if (result == null) {
  throw Exception('[${name.substring(1)}]: requested to parse from dynamic, but the input is null.',);
}

return result;
''');
        }),
      );

      c.methods.add(
        Method((m) {
          m.static = true;
          m.returns = Reference('${c.name}?');
          m.name = 'maybeFromDynamic';
          m.requiredParameters.add(
            Parameter((p) {
              p.name = 'map';
              p.type = const Reference('dynamic');
              p.named = false;
            }),
          );
          m.optionalParameters.add(
            Parameter((p) {
              p.name = 'args';
              p.type = const Reference('Map<String, dynamic>');
              p.defaultTo = const Code('const {}');
              p.named = true;
            }),
          );
          m.optionalParameters.add(
            Parameter((p) {
              p.name = 'registry';
              p.type = const Reference('JsonWidgetRegistry?');
              p.named = true;
            }),
          );
          final lines = <String>[];
          for (var param in params) {
            if (param.isBuilderParam) {
              // comes from the build method, not the data map.
              continue;
            }
            if (param.displayName != 'key') {
              lines.add(
                '${param.displayName}: ${decode(element, param, aliases: aliases, defaults: paramDefaults, paramDecoders: paramDecoders.keys)}',
              );
            }
          }

          m.body = Code('''
${c.name}? result;

if (map != null) {
  if (map is String) {
    map = yaon.parse(map, normalize: true,);
  }

  if (map is ${c.name}) {
    result = map;
  } else {
    registry ??= JsonWidgetRegistry.instance;
    map = registry.processArgs(map, <String>{}).value;
    result = ${c.name}(
      args,
      ${lines.join(',')}${lines.isNotEmpty ? ',' : ''}
    );
  }
          }

return result;
''');
        }),
      );

      c.methods.add(
        Method((m) {
          m.name = 'toJson';
          m.annotations.add(const CodeExpression(Code('override')));
          m.returns = const Reference('Map<String, dynamic>');

          final customEncoders = StringBuffer();
          final buf = StringBuffer();

          for (var param in params) {
            if (param.isBuilderParam) {
              // comes from the build method, not the data map.
              continue;
            }
            if (param.displayName != 'key') {
              final name = aliases[param.displayName] ?? param.displayName;
              final encoder = paramEncoders[name];

              var defaultValueCode =
                  paramDefaults[name] ?? param.defaultValueCode;
              if (defaultValueCode == 'const <Widget>[]') {
                defaultValueCode = 'const <JsonWidgetData>[]';
              }
              if (encoder != null) {
                customEncoders.write('''
final ${name}Encoded = ${encoder.enclosingElement?.displayName}.${encoder.name}(${param.displayName});
''');

                buf.write('''
'$name': ${defaultValueCode == null ? '' : '$defaultValueCode == $name ? null : '}${name}Encoded,
''');
              } else {
                final encoder = encode(
                  element,
                  param,
                  aliases: aliases,
                  defaults: paramDefaults,
                );

                buf.write(encoder);
              }
            }

            m.body = Code('''
${customEncoders.toString()}

return JsonClass.removeNull({
${buf.toString()}
...args,
});
''');
          }
        }),
      );
    } catch (e, stack) {
      print('$e\n$stack\n');
      if (!_isDebugMode) {
        rethrow;
      }
    }
  }

  void _generateSchema(
    ClassBuilder c, {
    required Map<String, String> aliases,
    required String packageName,
    required List<Param> params,
    required String schemaBaseUrl,
    required Map<String, MethodElement> schemaDecoders,
    required String? schemaName,
    required void Function(String) schemaNameCallback,
    required String widgetName,
  }) {
    final properties = StringBuffer();
    final id =
        '$schemaBaseUrl/$packageName/${ReCase(widgetName).snakeCase}.json';

    var name = widgetName;
    name = name.replaceAll(RegExp(r'\<.*\>'), '');
    if (name.startsWith('_')) {
      name = name.substring(1);
    }
    schemaName ??= '${name}Schema';
    schemaNameCallback(schemaName);
    c.name = schemaName;

    for (var param in params) {
      if (param.isBuilderParam) {
        // comes from the build method, not the data map.
        continue;
      }
      final name = aliases[param.displayName] ?? param.displayName;
      if (param.displayName != 'key') {
        final type = _withoutNullability(param.typeName);

        final sMethod = schemaDecoders[name];
        if (sMethod == null) {
          final fun = kSchemaDecoders[type];

          final schema = fun == null ? 'SchemaHelper.anySchema' : fun(param);
          properties.write("'$name': $schema,\n");
        } else {
          if (!sMethod.isStatic) {
            throw 'Schema only supports static methods';
          }
          properties.write(
            "'$name': ${sMethod.enclosingElement?.displayName}.${sMethod.displayName}(),",
          );
        }
      }
    }
    c.fields.add(
      Field((f) {
        f.name = 'id';
        f.modifier = FieldModifier.constant;
        f.static = true;
        f.assignment = Code("'$id'");
      }),
    );
    c.fields.add(
      Field((f) {
        f.name = 'schema';
        f.modifier = FieldModifier.final$;
        f.static = true;
        f.assignment = Code('''
<String, Object>{
  r'\$schema': 'http://json-schema.org/draft-07/schema#',
  r'\$id': id,
  'title': '$widgetName',
  'type': 'object',
  'additionalProperties': false,
  'properties': {
    ${properties.toString()}
  },
}
''');
      }),
    );
  }

  String _prepareCode({
    required String builderCode,
    required String jsonWidgetCode,
    required String modelCode,
    required String schemaCode,
    required String? widgetName,
  }) =>
      '''
// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use
${widgetName?.startsWith('_') == true ? '// ignore_for_file: library_private_types_in_public_api' : ''}
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

$builderCode

$jsonWidgetCode

$modelCode

$schemaCode
''';
}

void _buildClassFields({
  required Map<String, String> aliases,
  required ClassBuilder c,
  required Map<String, MethodElement> paramDecoders,
  required List<Param> params,
  required InterfaceType widget,
  required Map<String, String> widgetFieldDocs,
}) {
  for (var p in params) {
    if (p.isBuilderParam) {
      // comes from the build method, not the data map.
      continue;
    }
    if ( /*!kChildNames.containsKey(p.name) &&*/ p.displayName != 'key') {
      final method = paramDecoders[aliases[p.displayName] ?? p.displayName];
      var type = p.typeName;

      if (type == 'Widget' || type == 'PreferredSizeWidget') {
        type = 'JsonWidgetData';
      } else if (type == 'Widget?' || type == 'PreferredSizeWidget?') {
        type = 'JsonWidgetData?';
      } else if (type == 'List<Widget>' ||
          type == 'List<PreferredSizeWidget>') {
        type = 'List<JsonWidgetData>';
      } else if (type == 'List<Widget>?' ||
          type == 'List<PreferredSizeWidget>?') {
        type = 'List<JsonWidgetData>?';
      }

      c.fields.add(
        Field((f) {
          final docs = widgetFieldDocs[p.displayName];
          if (docs != null) {
            f.docs.add(
              '  /* AUTOGENERATED FROM [${_withoutNullability(widget.getDisplayString())}.${p.displayName}]*/',
            );
            f.docs.add(docs);
          }

          f.modifier = FieldModifier.final$;
          f.name = p.displayName;
          f.type = Reference(method == null ? type : 'dynamic');
        }),
      );
    }
  }
}

void _buildConstructorParams({
  required Map<String, String> aliases,
  required ConstructorBuilder con,
  required Map<String, MethodElement> paramDecoders,
  required Map<String, String> paramDefaults,
  required List<Param> params,
  List<String>? positionedParams,
}) {
  positionedParams?.forEach((paramName) {
    if (paramName != 'key') {
      con.requiredParameters.add(
        Parameter((param) {
          final name = aliases[paramName] ?? paramName;
          final p = params.firstWhere((p) => p.displayName == paramName);
          param.name = paramName;
          param.named = false;

          var defaultValueCode = paramDefaults[name] ?? p.defaultValueCode;
          if (defaultValueCode == 'const <Widget>[]') {
            defaultValueCode = 'const <JsonWidgetData>[]';
          }

          param.defaultTo =
              defaultValueCode == null ||
                  (!paramDefaults.containsKey(name) &&
                      paramDecoders.containsKey(name))
              ? null
              : Code(defaultValueCode);
          param.toThis = true;
        }),
      );
    }
  });

  for (var p in params) {
    if (p.isBuilderParam || positionedParams?.contains(p.displayName) == true) {
      continue;
    }

    if (p.displayName != 'key') {
      con.optionalParameters.add(
        Parameter((param) {
          final name = aliases[p.displayName] ?? p.displayName;
          final decoder = paramDecoders[name];
          var defaultValueCode = paramDefaults[name] ?? p.defaultValueCode;
          if (defaultValueCode == 'const <Widget>[]') {
            defaultValueCode = 'const <JsonWidgetData>[]';
          }

          bool hasAnyRequiredParameter(MethodElement? me) {
            if (me == null) return false;
            return me.formalParameters.any((pe) {
              return pe.isPositional ||
                  pe.isRequiredPositional ||
                  pe.isRequiredNamed;
            });
          }

          param.name = p.displayName;
          param.named = true;
          param.defaultTo =
              defaultValueCode == null ||
                  (!paramDefaults.containsKey(name) &&
                      paramDecoders.containsKey(name))
              ? null
              : Code(defaultValueCode);
          param.required =
              param.defaultTo == null &&
              (p.isRequired || hasAnyRequiredParameter(decoder));
          param.toThis = true;
        }),
      );
    }
  }
}

void _buildCustomParamBuilder({
  required Map<String, String> aliases,
  required StringBuffer buf,
  required List<String> lines,
  required Param param,
  required Map<String, MethodElement> paramDecoders,
  required bool positioned,
  required List<String> positionedParams,
}) {
  final method = paramDecoders[aliases[param.displayName] ?? param.displayName];

  final name = param.displayName;
  final prefix = positioned ? '' : '${param.displayName}: ';

  if (param.isBuilderParam ||
      param.displayName == 'key' ||
      param.displayName == 'context') {
    lines.add('$prefix${param.displayName}');
  } else if (method == null) {
    final type = param.typeName;
    if (type == 'Widget') {
      lines.add('''
${prefix}model.$name.build(
  childBuilder: childBuilder,
  context: context,
)
''');
    } else if (type == 'Widget?') {
      lines.add('''
${prefix}model.$name?.build(
  childBuilder: childBuilder,
  context: context,
)
''');
    } else if (type == 'PreferredSizeWidget') {
      lines.add('''
${prefix}model.$name.build(
  childBuilder: childBuilder,
  context: context,
) as PreferredSizeWidget
''');
    } else if (type == 'PreferredSizeWidget?') {
      lines.add('''
${prefix}model.$name?.build(
  childBuilder: childBuilder,
  context: context,
) as PreferredSizeWidget?
''');
    } else if (type == 'List<Widget>') {
      lines.add('''
$prefix[
  for (var d in model.$name)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ),
  ]
''');
    } else if (type == 'List<Widget>?') {
      lines.add('''
${prefix}model.$name == null ? null : [
  for (var d in model.$name!)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ),
  ]
''');
    } else if (type == 'List<PreferredSizeWidget>') {
      lines.add('''
$prefix<PreferredSizeWidget>[
  for (var d in model.$name)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ) as PreferredSizeWidget,
  ]
''');
    } else if (type == 'List<PreferredSizeWidget>?') {
      lines.add('''
${prefix}model.${param.displayName} == null ? null : <PreferredSizeWidget>[
  for (var d in model.$name!)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ) as PreferredSizeWidget,
  ]
''');
    } else {
      lines.add('${prefix}model.$name');
    }
  } else {
    final pPrefix = positioned ? '' : '$name: ';
    lines.add('$pPrefix${name}Decoded');

    final decoderParams = <String>[];
    for (var field in method.formalParameters) {
      if (field.name == 'childBuilder') {
        decoderParams.add('childBuilder: childBuilder,');
      } else if (field.name == 'context') {
        decoderParams.add('context: context,');
      } else if (field.name == 'data') {
        decoderParams.add('data: data,');
      } else if (field.name == 'model') {
        decoderParams.add('model: model,');
      } else if (field.name == 'registry') {
        decoderParams.add('registry: data.jsonWidgetRegistry,');
      } else if (field.name == 'value') {
        decoderParams.add('value: model.${param.displayName},');
      }
    }

    buf.write('''
final ${name}Decoded = ${paramDecoders[aliases[name] ?? name]!.name}(
  ${decoderParams.join('\n')}
);
''');
  }
}

String _withoutNullability(String nullableType) => nullableType.endsWith('?')
    ? nullableType.substring(0, nullableType.length - 1)
    : nullableType;
