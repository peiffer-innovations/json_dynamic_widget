import 'package:meta/meta.dart';

@immutable
class DynamicParamsResult {
  const DynamicParamsResult({
    this.dynamicKeys,
    required this.values,
  });

  final Set<String>? dynamicKeys;
  final dynamic values;

  @override
  bool operator ==(other) {
    var result = false;

    if (other is DynamicParamsResult) {
      result = true;
      result =
          result && dynamicKeys?.toString() == other.dynamicKeys?.toString();
      result = result && values?.toString() == other.values?.toString();
    }

    return result;
  }

  @override
  int get hashCode =>
      (31 * (dynamicKeys?.hashCode ?? 0)) * (values?.hashCode ?? 0);

  @override
  String toString() => 'DynamicParamsResult({$dynamicKeys}, {$values})';
}
