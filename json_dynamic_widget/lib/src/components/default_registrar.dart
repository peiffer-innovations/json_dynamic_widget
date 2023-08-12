// ignore: unused_import
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'default_registrar.g.dart';

@jsonWidgetRegistrar
abstract class _DefaultRegistrar {
  @JsonWidgetRegistration(
    builder: 'JsonDropdownButtonFormFieldBuilder',
    schema: 'DropdownButtonFormFieldSchema',
    widget: 'DropdownButtonFormField',
  )
  void withDropdownButtonFormField();

  @JsonWidgetRegistration(
    builder: 'JsonDynamicBuilder',
    schema: 'DynamicSchema',
    widget: 'Dynamic',
  )
  void withDynamic();
}
