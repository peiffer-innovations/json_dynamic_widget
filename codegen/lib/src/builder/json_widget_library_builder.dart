import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:json_dynamic_widget_codegen/json_dynamic_widget_codegen.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';
import 'package:yaon/yaon.dart';

class JsonWidgetLibraryBuilder extends GeneratorForAnnotation<JsonWidget> {
  static const kChildNames = <String>{
    'child',
    'children',
  };
  static const kInternalNames = <String>{
    //   'childBuilder',
    //   'data',
    //   'model',
  };

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    var constBuilder = false;
    final autoRegister = annotation.read('autoRegister').boolValue;
    String? widgetName;
    String? typeName;
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
    final schemaBaseUrl = pubspec['schema_url'] ??
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
    const aliasChecker = TypeChecker.fromRuntime(JsonArgAlias);
    const builderParamChecker = TypeChecker.fromRuntime(JsonBuildArg);
    const builderChecker = TypeChecker.fromRuntime(JsonBuilder);
    const positionedChecker = TypeChecker.fromRuntime(JsonPositionedParam);
    const schemaNameChecker = TypeChecker.fromRuntime(JsonSchemaName);

    var conHasRegistry = false;

    ConstructorElement? eCon;
    for (var c in element.constructors) {
      if (c.name == '') {
        eCon = c;
        for (var p in c.parameters) {
          if (p.name == 'registry') {
            conHasRegistry = true;
          }
        }
      }
    }
    if (eCon == null) {
      throw Exception('Unable to locate a default constructor.');
    }

    for (var m in element.methods) {
      final annotation = builderChecker.firstAnnotationOf(m);
      if (annotation != null) {
        method = m;
        break;
      }
    }
    if (method == null) {
      for (var m in element.methods) {
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
      schemaName =
          ConstantReader(schemaNameAnnotation).read('name').stringValue;
    }

    final positionedAnnotations = positionedChecker.annotationsOf(method);
    for (var annotation in positionedAnnotations) {
      final name = ConstantReader(annotation).read('name').stringValue;
      positionedParams.add(name);
    }

    final aliasAnnotations = aliasChecker.annotationsOf(method);
    final aliases = <String, String>{};
    for (var annotation in aliasAnnotations) {
      final name = ConstantReader(annotation).read('name').stringValue;
      final alias = ConstantReader(annotation).read('alias').stringValue;
      aliases[name] = alias;
    }

    final paramDecoders = <String, MethodElement>{};
    final schemaDecoders = <String, MethodElement>{};
    const paramChecker = TypeChecker.fromRuntime(JsonArgDecoder);
    const paramSchemaChecker = TypeChecker.fromRuntime(JsonArgSchema);
    for (var m in element.methods) {
      final paramAnnotation = paramChecker.firstAnnotationOf(m);
      final schemaAnnotation = paramSchemaChecker.firstAnnotationOf(m);
      if (paramAnnotation != null) {
        final param = ConstantReader(paramAnnotation).read('param').stringValue;
        paramDecoders[param] = m;
      }

      if (schemaAnnotation != null) {
        if (!m.isStatic) {
          throw Exception(
            'Encountered [JsonArgSchema] annotation on a non-static method named: [${m.displayName}].',
          );
        }
        final param =
            ConstantReader(schemaAnnotation).read('param').stringValue;
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
        widgetFieldDocs[f.name] = docs;
      }
    }

    widgetName ??= widget.getDisplayString(withNullability: false);

    ConstructorElement? wCon;
    for (var c in widget.constructors) {
      if (c.name == '') {
        wCon = c;
      }
    }

    if (wCon == null) {
      throw Exception(
        'Cannot find unnamed constructor in [${widget.getDisplayString(withNullability: false)}]',
      );
    }

    final wConstructor = wCon;

    final params = wConstructor.parameters;

    final generated = Class((c) {
      c.name = name.substring(1);
      c.extend = Reference(name);
      params.sort((a, b) {
        var result = a.name.compareTo(b.name);

        if (kChildNames.contains(a.name)) {
          if (!kChildNames.contains(b.name)) {
            result = 1;
          }
        }
        if (kChildNames.contains(b.name)) {
          if (!kChildNames.contains(a.name)) {
            result = -1;
          }
        }

        return result;
      });

      c.fields.add(Field((f) {
        f.name = 'kType';
        f.static = true;
        f.modifier = FieldModifier.constant;
        f.assignment = Code(
          "'${typeName ?? ReCase(widgetName!).snakeCase.replaceAll(RegExp(r'\<.*\>'), '')}'",
        );
      }));

      c.fields.add(Field((f) {
        f.name = 'args';
        f.type = const Reference('dynamic');
        f.modifier = FieldModifier.final$;
      }));

      c.constructors.add(Constructor((con) {
        con.constant = eCon != null && eCon.isConst;
        constBuilder = con.constant;

        con.optionalParameters.add(
          Parameter(
            (param) {
              param.name = 'args';
              param.named = true;
              param.required = true;
              param.toThis = true;
            },
          ),
        );

        if (conHasRegistry) {
          con.optionalParameters.add(Parameter((param) {
            param.name = 'registry';
            param.named = true;
            param.required = true;
            param.toSuper = true;
          }));
        }
      }));

      c.methods.add(Method((m) {
        m.name = 'fromDynamic';
        m.static = true;
        m.requiredParameters.add(Parameter((p) {
          p.name = 'map';
          p.type = const Reference('dynamic');
        }));
        m.optionalParameters.add(Parameter((p) {
          p.name = 'registry';
          p.type = const Reference('JsonWidgetRegistry?');
          p.named = true;
          p.required = false;
        }));

        m.returns = Reference(c.name);
        m.lambda = true;

        m.body = Code('''
${c.name}(
  args: map,
  ${conHasRegistry ? 'registry: registry,' : ''}
)

''');
      }));

      c.methods.add(Method((m) {
        m.name = method!.name;
        m.annotations.add(const CodeExpression(Code('override')));
        m.returns = Reference(widget.getDisplayString(withNullability: true));

        m.optionalParameters.add(Parameter((p) {
          p.name = 'childBuilder';
          p.named = true;
          p.required = false;
          p.type = const Reference('ChildWidgetBuilder?');
        }));
        m.optionalParameters.add(Parameter((p) {
          p.name = 'context';
          p.named = true;
          p.required = true;
          p.type = const Reference('BuildContext');
        }));
        m.optionalParameters.add(Parameter((p) {
          p.name = 'data';
          p.named = true;
          p.required = true;
          p.type = const Reference('JsonWidgetData');
        }));
        m.optionalParameters.add(Parameter((p) {
          p.name = 'key';
          p.named = true;
          p.required = false;
          p.type = const Reference('Key?');
        }));

        final lines = <String>[];
        final buf = StringBuffer();
        for (var pos in positionedParams) {
          // lines.add('model.$pos');
          _buildCustomParamBuilder(
            aliases: aliases,
            buf: buf,
            builderParamChecker: builderParamChecker,
            positioned: true,
            lines: lines,
            param: params.firstWhere((p) => p.name == pos),
            paramDecoders: paramDecoders,
            positionedParams: positionedParams,
          );
        }
        for (var param in params) {
          if (!positionedParams.contains(param.name)) {
            _buildCustomParamBuilder(
              aliases: aliases,
              buf: buf,
              builderParamChecker: builderParamChecker,
              positioned: false,
              lines: lines,
              param: param,
              paramDecoders: paramDecoders,
              positionedParams: positionedParams,
            );
          }
        }

        m.body = Code('''
final model = ${c.name}Model.fromDynamic(
  args,
  registry: data.registry,
);

${buf.toString()}
return ${widget.getDisplayString(withNullability: false)}(
  ${lines.join(',')}${lines.isNotEmpty ? ',' : ''}
);
''');
      }));
    });

    final emitter = DartEmitter(useNullSafetySyntax: true);
    final builderCode = generated.accept(emitter).toString();

    final model = Class((c) {
      final docs = wConstructor.documentationComment;
      if (docs != null) {
        c.docs.add(
            '/* AUTOGENERATED FROM [${widget.getDisplayString(withNullability: false)}]*/');
        c.docs.add(docs);
      }
      c.name = '${name.substring(1)}Model';
      c.constructors.add(
        Constructor(
          (con) {
            con.constant = true;

            for (var p in params) {
              final annotation = builderParamChecker.firstAnnotationOf(p);
              if (annotation != null) {
                // comes from the build method, not the data map.
                continue;
              }

              if (/*!kChildNames.containsKey(p.name) && */ p.name != 'key') {
                con.optionalParameters.add(
                  Parameter(
                    (param) {
                      param.name = p.name;
                      param.named = true;
                      param.required = true;
                      param.toThis = true;
                    },
                  ),
                );
              }
            }
          },
        ),
      );
      for (var p in params) {
        final annotation = builderParamChecker.firstAnnotationOf(p);
        if (annotation != null) {
          // comes from the build method, not the data map.
          continue;
        }
        if (/*!kChildNames.containsKey(p.name) &&*/ p.name != 'key') {
          final method = paramDecoders[aliases[p.name] ?? p.name];
          var type = p.type.getDisplayString(withNullability: true);

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
            Field(
              (f) {
                final docs = widgetFieldDocs[p.name];
                if (docs != null) {
                  f.docs.add(
                    '/* AUTOGENERATED FROM [${widget.getDisplayString(withNullability: false)}.${p.name}]*/',
                  );
                  f.docs.add(docs);
                }
                f.modifier = FieldModifier.final$;
                f.name = p.name;
                f.type = Reference(
                  method == null ? type : 'dynamic',
                );
              },
            ),
          );
        }
      }
      c.methods.add(
        Method(
          (m) {
            m.static = true;
            m.returns = Reference(c.name);
            m.name = 'fromDynamic';
            m.requiredParameters.add(
              Parameter(
                (p) {
                  p.name = 'map';
                  p.type = const Reference('dynamic');
                  p.named = false;
                },
              ),
            );
            m.optionalParameters.add(
              Parameter(
                (p) {
                  p.name = 'registry';
                  p.type = const Reference('JsonWidgetRegistry?');
                  p.named = true;
                },
              ),
            );
            m.body = Code('''
final result = maybeFromDynamic(map, registry: registry,);

if (result == null) {
  throw Exception('[${name.substring(1)}]: requested to parse from dynamic, but the input is null.',);
}

return result;
''');
          },
        ),
      );

      c.methods.add(
        Method(
          (m) {
            m.static = true;
            m.returns = Reference('${c.name}?');
            m.name = 'maybeFromDynamic';
            m.requiredParameters.add(
              Parameter(
                (p) {
                  p.name = 'map';
                  p.type = const Reference('dynamic');
                  p.named = false;
                },
              ),
            );
            m.optionalParameters.add(
              Parameter(
                (p) {
                  p.name = 'registry';
                  p.type = const Reference('JsonWidgetRegistry?');
                  p.named = true;
                },
              ),
            );
            final lines = <String>[];
            for (var param in params) {
              final annotation = builderParamChecker.firstAnnotationOf(param);
              if (annotation != null) {
                // comes from the build method, not the data map.
                continue;
              }
              if (/*!kChildNames.containsKey(param.name) &&*/ param.name !=
                  'key') {
                lines.add('${param.name}: ${decode(
                  element,
                  param,
                  aliases: aliases,
                  paramDecoders: paramDecoders.keys,
                )}');
              }
            }

            m.body = Code(
              '''
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
      ${lines.join(',')}${lines.isNotEmpty ? ',' : ''}
    );
  }
          }

return result;
''',
            );
          },
        ),
      );
    });

    final modelCode = model.accept(emitter).toString();

    final properties = StringBuffer();
    final schema = Class((c) {
      final id =
          '$schemaBaseUrl/$packageName/${ReCase(widgetName!).snakeCase}.json';

      var name = widgetName;
      name = name.replaceAll(RegExp(r'\<.*\>'), '');
      if (name.startsWith('_')) {
        name = name.substring(1);
      }
      schemaName ??= '${name}Schema';
      c.name = schemaName;

      for (var param in params) {
        final annotation = builderParamChecker.firstAnnotationOf(param);
        if (annotation != null) {
          // comes from the build method, not the data map.
          continue;
        }
        final name = aliases[param.displayName] ?? param.displayName;
        if (param.displayName != 'key') {
          final type = param.type.getDisplayString(withNullability: false);

          final sMethod = schemaDecoders[name];
          if (sMethod == null) {
            final fun = kSchemaDecoders[type];

            final schema = fun == null ? 'SchemaHelper.anySchema' : fun(param);
            properties.write("'$name': $schema,\n");
          } else {
            properties.write(
              "'$name': ${element.name}.${sMethod.displayName}(),",
            );
          }
        }
      }
      c.fields.add(Field((f) {
        f.name = 'id';
        f.modifier = FieldModifier.constant;
        f.static = true;
        f.assignment = Code("'$id'");
      }));
      c.fields.add(Field((f) {
        f.name = 'schema';
        f.modifier = FieldModifier.final$;
        f.static = true;
        f.assignment = Code(
          '''
<String, Object>{
  r'\$schema': 'http://json-schema.org/draft-06/schema#',
  r'\$id': id,
  'title': '$widgetName',
  'type': 'object',
  'additionalProperties': false,
  'properties': {
    ${properties.toString()}
  },
}
''',
        );
      }));
    });

    final schemaCode = schema.accept(emitter).toString();

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

    return '''
// ignore_for_file: deprecated_member_use
${widgetName.startsWith('_') ? '// ignore_for_file: library_private_types_in_public_api' : ''}
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: unused_local_variable

$builderCode

$modelCode

$schemaCode
''';
  }
}

void _buildCustomParamBuilder({
  required Map<String, String> aliases,
  required StringBuffer buf,
  required TypeChecker builderParamChecker,
  required List<String> lines,
  required ParameterElement param,
  required Map<String, MethodElement> paramDecoders,
  required bool positioned,
  required List<String> positionedParams,
}) {
  final method = paramDecoders[aliases[param.name] ?? param.name];
  final annotation = builderParamChecker.firstAnnotationOf(param);

  final prefix = positioned ? '' : '${param.name}: ';

  if (annotation != null || param.name == 'key' || param.name == 'context') {
    lines.add('$prefix${param.name}');
  } else if (method == null) {
    final type = param.type.getDisplayString(withNullability: true);
    if (type == 'Widget') {
      lines.add('''
${prefix}model.${param.name}.build(
  childBuilder: childBuilder,
  context: context,
)
''');
    } else if (type == 'Widget?') {
      lines.add('''
${prefix}model.${param.name}?.build(
  childBuilder: childBuilder,
  context: context,
)
''');
    } else if (type == 'PreferredSizeWidget') {
      lines.add('''
${prefix}model.${param.name}.build(
  childBuilder: childBuilder,
  context: context,
) as PreferredSizeWidget
''');
    } else if (type == 'PreferredSizeWidget?') {
      lines.add('''
${prefix}model.${param.name}?.build(
  childBuilder: childBuilder,
  context: context,
) as PreferredSizeWidget?
''');
    } else if (type == 'List<Widget>') {
      lines.add('''
$prefix[
  for (var d in model.${param.name})
    d.build(
    childBuilder: childBuilder,
    context: context,
  ),
  ]
''');
    } else if (type == 'List<Widget>?') {
      lines.add('''
${prefix}model.${param.name} == null ? null : [
  for (var d in model.${param.name}!)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ),
  ]
''');
    } else if (type == 'List<PreferredSizeWidget>') {
      lines.add('''
$prefix<PreferredSizeWidget>[
  for (var d in model.${param.name})
    d.build(
    childBuilder: childBuilder,
    context: context,
  ) as PreferredSizeWidget,
  ]
''');
    } else if (type == 'List<PreferredSizeWidget>?') {
      lines.add('''
${prefix}model.${param.name} == null ? null : <PreferredSizeWidget>[
  for (var d in model.${param.name}!)
    d.build(
    childBuilder: childBuilder,
    context: context,
  ) as PreferredSizeWidget,
  ]
''');
    } else {
      lines.add('${prefix}model.${param.name}');
    }
  } else {
    final pName = aliases[param.name] ?? param.name;
    final pPrefix = positioned ? '' : '$pName: ';
    lines.add('$pPrefix${pName}Decoded');

    final decoderParams = <String>[];
    for (var field in method.parameters) {
      if (field.name == 'childBuilder') {
        decoderParams.add('childBuilder: childBuilder,');
      } else if (field.name == 'context') {
        decoderParams.add('context: context,');
      } else if (field.name == 'data') {
        decoderParams.add('data: data,');
      } else if (field.name == 'model') {
        decoderParams.add('model: model,');
      } else if (field.name == 'registry') {
        decoderParams.add('registry: data.registry,');
      } else if (field.name == 'value') {
        decoderParams.add('value: model.${param.name},');
      }
    }

    buf.write('''
final ${pName}Decoded = ${paramDecoders[pName]!.name}(
  ${decoderParams.join('\n')}
);
''');
  }
}
