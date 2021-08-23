import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/src/builders/json_dynamic_builder.dart';
import 'package:collection/collection.dart';

/// Function key for the built in `dynamic` function.
final String key = 'dynamic';

/// Function body for the built in `dynamic` function.
/// It accepts variable names which values should be convertable into [DynamicOperation].
/// It tries to call [DynamicOperation.execute] on each of the operations and
/// updates list of values which lies under [DynamicOperation.builder] field.
/// That action should trigger rebuilt of [JsonDynamicBuilder] which listen to [DynamicOperation.builder] variable.
final JsonWidgetFunction body = (
        {required List<dynamic>? args, required JsonWidgetRegistry registry}) =>
    () {
      if (args != null) {
        args
            .map((dynamicOperationVarName) =>
                registry.getValue(dynamicOperationVarName))
            .map((json) => _executeFunctions(Map<String, dynamic>.from(json)))
            .map((json) => DynamicOperation.fromJson(json))
            .forEach((json) => _execute(json, registry));
      }
    };

void _execute(final DynamicOperation dynamicOperation,
    final JsonWidgetRegistry registry) {
  var childrenData = List<Map<String, dynamic>>.from(
      registry.getValue(dynamicOperation.builder));
  var index = dynamicOperation.findIndex(childrenData);
  dynamicOperation.execute(childrenData, index);
  registry.setValue(dynamicOperation.builder, childrenData);
}

Map<String, dynamic> _executeFunctions(final Map<String, dynamic> json) {
  for (var key in json.keys) {
    var value = json[key];
    if (value is Function) {
      value = value();
    } else if (value is Map) {
      value = _executeFunctions(Map<String, dynamic>.from(value));
    }
    json[key] = value;
  }
  return json;
}

/// Supported dynamic operations types:
/// 1. [ADD] - adds a new child into [JsonDynamicBuilder] specified via [DynamicOperation.builder]
/// 2. [REMOVE] - removes a child of [JsonDynamicBuilder] specified via [DynamicOperation.builder]
/// 3. [EDIT] - edits a child of [JsonDynamicBuilder] specified via [DynamicOperation.builder]
enum DynamicOperationType { ADD, REMOVE, EDIT }

/// Gets a name of [DynamicOperationType].
extension DynamicOperationTypeExtension on DynamicOperationType {
  String? get name {
    switch (this) {
      case DynamicOperationType.ADD:
        return 'add';
      case DynamicOperationType.REMOVE:
        return 'remove';
      case DynamicOperationType.EDIT:
        return 'edit';
      default:
        return null;
    }
  }
}

/// Operation which defines adding of the new child into [JsonDynamicBuilder].
class AddDynamicOperation extends DynamicOperation {
  AddDynamicOperation(
      {required String builder,
      Map<String, dynamic> target = targetDefault,
      required Map<String, dynamic> values})
      : super(
            builder: builder,
            target: target,
            values: DynamicValuesFactory.create(values));

  static const targetDefault = {'index': -1};

  @override
  DynamicOperationType get type => DynamicOperationType.ADD;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData.insert(index, values);
  }
}

/// Operation which defines removing the child of [JsonDynamicBuilder].
class RemoveDynamicOperation extends DynamicOperation {
  RemoveDynamicOperation(
      {required String builder,
      required Map<String, dynamic> target,
      required Map<String, dynamic> values})
      : super(builder: builder, target: target, values: values);

  @override
  DynamicOperationType get type => DynamicOperationType.REMOVE;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData.removeAt(index);
  }
}

/// Operation which defines editing the child of [JsonDynamicBuilder].
class EditDynamicOperation extends DynamicOperation {
  EditDynamicOperation(
      {required String builder,
      required Map<String, dynamic> target,
      required Map<String, dynamic> values})
      : super(builder: builder, target: target, values: values);

  @override
  DynamicOperationType get type => DynamicOperationType.EDIT;

  @override
  void execute(final List<Map<String, dynamic>> childrenData, int index) {
    childrenData[index].addAll(values);
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
        (e) => e.name!.toLowerCase() == json[typeKey].toString().toLowerCase());
    final values = Map<String, dynamic>.from(json[valuesKey] ?? {}).map(
        (key, value) => MapEntry(key, value is Function ? value() : value));
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

  /// Variable which state is listened by [JsonDynamicBuilder].
  /// Any modificiation of that variable triggers [JsonDynamicBuilder] rebuild.
  final String builder;

  /// Data used to find correct child of [JsonDynamicBuilder] which should be affected
  /// by an operation. For e.g. :
  /// 1. Targeting the last child:
  /// {
  ///   "index" : -1
  /// }
  /// 2. Targeting the child by its id:
  /// {
  ///   "id" : "123"
  /// }
  final Map<String, dynamic> target;

  /// Values that are passed to a targeted via [target] child of [builder] variable.
  final Map<String, dynamic> values;

  static const _targetIndexKey = 'index';
  static const typeKey = 'type';
  static const builderKey = 'builder';
  static const targetKey = 'target';
  static const valuesKey = 'values';
  static const valuesIdKey = 'id';

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

    index = childrenData.indexWhere((childData) => target.entries.every(
        (entry) => DeepCollectionEquality()
            .equals(entry.value, childData[entry.key])));
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
