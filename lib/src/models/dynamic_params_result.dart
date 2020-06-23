import 'package:meta/meta.dart';

class DynamicParamsResult {
  DynamicParamsResult({
    this.dynamicKeys,
    @required this.values,
  });

  final Set<String> dynamicKeys;
  final dynamic values;
}
