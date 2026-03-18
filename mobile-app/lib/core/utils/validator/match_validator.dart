import 'base_validator.dart';

class MatchValidator extends TextFieldValidator {
  final String valueToMatch;

  MatchValidator({required this.valueToMatch, required String errorText})
      : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value == valueToMatch;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}