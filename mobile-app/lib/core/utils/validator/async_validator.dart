import 'base_validator.dart';

class AsyncValidator extends TextFieldValidator {
  AsyncValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return errorText.isEmpty;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}