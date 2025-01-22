import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

extension DartTypeNullability on DartType {
  bool get nullable => nullabilitySuffix == NullabilitySuffix.question;

  String toNonNullableString() {
    var result = getDisplayString();

    if (nullabilitySuffix == NullabilitySuffix.question) {
      result = result.substring(0, result.length - 1);
    }

    return result;
  }
}
