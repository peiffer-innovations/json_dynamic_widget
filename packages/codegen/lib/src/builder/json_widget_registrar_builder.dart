import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:json_dynamic_widget_codegen/json_dynamic_widget_codegen.dart';
import 'package:source_gen/source_gen.dart';

class JsonWidgetRegistrarBuilder
    extends GeneratorForAnnotation<JsonWidgetRegistrar> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final name = element.name!;
    if (!name.startsWith('_')) {
      throw Exception('Class must be private, but [$name] is not private.');
    }
    if (element is! ClassElement) {
      throw Exception('Annotation found but is not associated with a class.');
    }
    final emitter = DartEmitter(useNullSafetySyntax: true);
    final widgets = WidgetMetadata().data;

    const registrationChecker = TypeChecker.typeNamed(JsonWidgetRegistration);

    final manualRegistrations = <String, WidgetInfo>{};
    MethodElement? registerMethod;
    for (var m in element.methods) {
      final annotation = registrationChecker.firstAnnotationOf(m);
      if (m.name == 'register') {
        registerMethod = m;
      }
      if (annotation != null) {
        manualRegistrations[m.displayName] = WidgetInfo(
          autoRegister: true,
          builder: ConstantReader(annotation).read('builder').stringValue,
          constBuilder: false,
          schema: ConstantReader(annotation).read('schema').stringValue,
          widget: ConstantReader(annotation).read('widget').stringValue,
        );
      }
    }

    final generated = Class((c) {
      c.name = name.substring(1);
      c.extend = Reference(name);

      c.fields.add(
        Field((f) {
          f.name = '_builders';
          f.type = const Reference('Map<String, JsonWidgetBuilderContainer>');
          f.assignment = const Code('<String, JsonWidgetBuilderContainer>{}');
          f.modifier = FieldModifier.final$;
        }),
      );
      c.fields.add(
        Field((f) {
          f.name = '_schemas';
          f.type = const Reference('Map<String, Map<String, Object>>');
          f.assignment = const Code('<String, Map<String, Object>>{}');
          f.modifier = FieldModifier.final$;
        }),
      );

      c.methods.add(
        Method((m) {
          m.name = 'registerDefaults';
          m.optionalParameters.add(
            Parameter((p) {
              p.name = 'registry';
              p.type = const Reference('JsonWidgetRegistry?');
              p.named = true;
              p.required = false;
            }),
          );
          m.static = true;
          m.returns = Reference(c.name);

          final buf = StringBuffer();

          buf.writeln('registry ??= JsonWidgetRegistry.instance;');

          buf.writeln('return ${c.name}()');
          final registrations = <String>[];
          for (var entry in manualRegistrations.entries) {
            registrations.add('..${entry.key}()');
          }
          for (var w in widgets) {
            if (w.autoRegister) {
              registrations.add('..with${w.widget}()');
            }
          }

          registrations.sort();
          buf.write(registrations.join('\n'));
          buf.write('..register(registry);');

          m.body = Code(buf.toString());
        }),
      );

      c.methods.add(
        Method((m) {
          m.name = 'schemas';
          m.type = MethodType.getter;
          m.returns = const Reference('Map<String, Map<String, Object>>');
          m.lambda = true;
          m.body = const Code(
            'Map<String, Map<String, Object>>.from(_schemas)',
          );
        }),
      );

      c.methods.add(
        Method((m) {
          m.name = 'register';
          m.requiredParameters.add(
            Parameter((p) {
              p.name = 'registry';
              p.type = const Reference('JsonWidgetRegistry');
              p.named = false;
            }),
          );
          m.returns = const Reference('void');
          if (registerMethod != null) {
            m.annotations.add(const CodeExpression(Code('override')));
          }
          m.body = Code('''
${registerMethod == null ? '' : 'super.register(registry);'}
for (var b in _builders.entries) {
  registry.registerCustomBuilder(b.key, b.value);
}

final schemaCache = SchemaCache();
for (var s in _schemas.entries) {
  schemaCache.addSchema(s.key, s.value);
}
''');
        }),
      );

      for (var w in widgets) {
        c.methods.add(
          Method((m) {
            m.name = 'with${w.widget}';
            m.returns = const Reference('void');
            m.body = Code('''
_builders[${w.builder}.kType] =
    const JsonWidgetBuilderContainer(
  builder: ${w.builder}.fromDynamic,
  schemaId: ${w.schema}.id,
);
_schemas[${w.schema}.id] = ${w.schema}.schema;
''');
          }),
        );
      }

      for (var entry in manualRegistrations.entries) {
        c.methods.add(
          Method((m) {
            m.name = entry.key;
            m.annotations.add(const CodeExpression(Code('override')));
            m.returns = const Reference('void');

            final w = entry.value;
            m.body = Code('''
_builders[${w.builder}.kType] =
    const JsonWidgetBuilderContainer(
  builder: ${w.builder}.fromDynamic,
  schemaId: ${w.schema}.id,
);
_schemas[${w.schema}.id] = ${w.schema}.schema;
''');
          }),
        );
      }
    });

    final code = generated.accept(emitter).toString();
    return '''
$code
''';
  }
}
