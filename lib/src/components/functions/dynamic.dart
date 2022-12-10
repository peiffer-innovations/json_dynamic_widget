import 'dart:convert';

import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

/// It accepts variable names which values should be convertable
///  into [DynamicOperation]. It tries to call [DynamicOperation.execute]
/// on each of the operations and updates list of values which lies
/// under [DynamicOperation.builder] field. That action should trigger rebuilt
/// of [JsonDynamicBuilder] which listen to [DynamicOperation.builder] variable.
class DynamicFunction {
  static const key = 'dynamic';
  static final JsonWidgetFunction body = ({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) =>
      () {
        if (args != null) {
          args
              .map((key) => registry.getValue(key))
              .map((json) => _executeFunctions(Map<String, dynamic>.from(json)))
              .map((json) => DynamicOperation.fromJson(json))
              .forEach((json) => _execute(json, registry));
        }
      };

  static void _execute(
    final DynamicOperation dynamicOperation,
    final JsonWidgetRegistry registry,
  ) {
    var childrenJson = json.encode(registry.getValue(dynamicOperation.builder));
    var childrenData =
        List<Map<String, dynamic>>.from(json.decode(childrenJson));
    var index = dynamicOperation.findIndex(childrenData);
    dynamicOperation.execute(childrenData, index);
    registry.setValue(
      dynamicOperation.builder,
      childrenData,
      originator: null,
    );
  }

  static Map<String, dynamic> _executeFunctions(
      final Map<String, dynamic> json) {
    for (var key in json.keys) {
      var value = json[key];
      if (value is Function) {
        value = value();
      } else if (value is Map) {
        value = _executeFunctions(
          Map<String, dynamic>.from(value),
        );
      }
      json[key] = value;
    }
    return json;
  }
}

/// Operation which defines adding of the new child into [JsonDynamicBuilder].
class AddDynamicOperation extends DynamicOperation {
  AddDynamicOperation({
    required String builder,
    Map<String, dynamic> target = targetDefault,
    required Map<String, dynamic> values,
  }) : super(
          builder: builder,
          target: target,
          values: DynamicValuesFactory.create(values),
        );

  static const targetDefault = {'index': -1};

  @override
  DynamicOperationType get type => DynamicOperationType.ADD;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData.insert(index, values);
  }
}

/// Defines a dynamic operation on children of [JsonDynamicBuilder].
abstract class DynamicOperation extends JsonClass {
  DynamicOperation({
    required this.builder,
    required this.target,
    required this.values,
  });

  factory DynamicOperation.fromJson(dynamic json) {
    final type = DynamicOperationType.values.firstWhere(
      (e) => e.name!.toLowerCase() == json[typeKey].toString().toLowerCase(),
    );
    final values = Map<String, dynamic>.from(json[valuesKey] ?? {}).map(
      (key, value) => MapEntry(key, value is Function ? value() : value),
    );
    final target = Map<String, dynamic>.from(json[targetKey]);
    switch (type) {
      case DynamicOperationType.ADD:
        return AddDynamicOperation(
            builder: json[builderKey], target: target, values: values);
      case DynamicOperationType.REMOVE:
        return RemoveDynamicOperation(
            builder: json[builderKey], target: target, values: values);
      case DynamicOperationType.EDIT:
        return EditDynamicOperation(
            builder: json[builderKey], target: target, values: values);
      default:
        throw UnimplementedError();
    }
  }

  static const typeKey = 'type';
  static const builderKey = 'builder';
  static const targetKey = 'target';
  static const valuesKey = 'values';
  static const valuesIdKey = 'id';

  static const _targetIndexKey = 'index';

  /// Variable which state is listened by [JsonDynamicBuilder].
  /// Any modificiation of that variable triggers [JsonDynamicBuilder] rebuild.
  final String builder;

  /// Data used to find correct child of [JsonDynamicBuilder] which should
  ///  be affected by an operation. For e.g. :
  /// 1. Targeting the last child:
  /// {
  ///   "index" : -1
  /// }
  /// 2. Targeting the child by its id:
  /// {
  ///   "id" : "123"
  /// }
  final Map<String, dynamic> target;

  /// Values that are passed to a targeted
  /// via [target] child of [builder] variable.
  final Map<String, dynamic> values;

  /// Type of the operation.
  DynamicOperationType get type;

  ///Applying the operation to the [childrenData] at [index].
  void execute(List<Map<String, dynamic>> childrenData, int index);

  int findIndex(List<Map<String, dynamic>> childrenData) {
    int? index =
        target.containsKey(_targetIndexKey) ? target[_targetIndexKey] : null;
    if (index != null) {
      return index == -1 ? childrenData.length : index;
    }

    index = childrenData.indexWhere(
      (childData) => target.entries.every((entry) =>
          jsonEncode(entry.value) == jsonEncode(childData[entry.key])),
    );
    return index;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      typeKey: type.name,
      builderKey: builder,
      targetKey: target,
      valuesKey: values,
    };
  }
}

/// Supported dynamic operations types:
/// 1. [ADD] - adds a new child into [JsonDynamicBuilder]
/// specified via [DynamicOperation.builder]
/// 2. [REMOVE] - removes a child of [JsonDynamicBuilder]
/// specified via [DynamicOperation.builder]
/// 3. [EDIT] - edits a child of [JsonDynamicBuilder]
/// specified via [DynamicOperation.builder]
enum DynamicOperationType { ADD, REMOVE, EDIT }

/// Operation which defines editing the child of [JsonDynamicBuilder].
class EditDynamicOperation extends DynamicOperation {
  EditDynamicOperation({
    required String builder,
    required Map<String, dynamic> target,
    required Map<String, dynamic> values,
  }) : super(builder: builder, target: target, values: values);

  @override
  DynamicOperationType get type => DynamicOperationType.EDIT;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData[index].addAll(values);
  }
}

/// Operation which defines removing the child of [JsonDynamicBuilder].
class RemoveDynamicOperation extends DynamicOperation {
  RemoveDynamicOperation({
    required String builder,
    required Map<String, dynamic> target,
    required Map<String, dynamic> values,
  }) : super(builder: builder, target: target, values: values);

  @override
  DynamicOperationType get type => DynamicOperationType.REMOVE;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData.removeAt(index);
  }
}

/// Gets a name of [DynamicOperationType].
extension DynamicOperationTypeExtension on DynamicOperationType {
  String? get name {
    String? name;
    switch (this) {
      case DynamicOperationType.ADD:
        name = 'add';
        break;
      case DynamicOperationType.REMOVE:
        name = 'remove';
        break;
      case DynamicOperationType.EDIT:
        name = 'edit';
    }
    return name;
  }
}
