import 'base_validator.dart';

class NameValidator extends TextFieldValidator {

  NameValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    RegExp regex = RegExp(r'[%&]');
    return !(regex.hasMatch(value ?? ""));
  }
}