// ignore_for_file: unused_import

import 'package:example/src/dotted_border_builder.dart';
import 'package:example/src/svg_builder.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'example_registrar.g.dart';

@jsonWidgetRegistrar
abstract class _ExampleRegistrar {
  @JsonWidgetRegistration(
    builder: 'DottedBorderBuilder',
    schema: 'DottedBorderSchema',
    widget: 'DottedBorder',
  )
  void withDropdownButtonFormField();

  @JsonWidgetRegistration(
    builder: 'SvgBuilder',
    schema: 'SvgSchema',
    widget: 'Svg',
  )
  void withDynamic();
}
