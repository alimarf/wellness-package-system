import 'base_validator.dart';

class RequiredValidator extends TextFieldValidator {
  RequiredValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value != null && value.isNotEmpty && value.trim().isNotEmpty;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}

