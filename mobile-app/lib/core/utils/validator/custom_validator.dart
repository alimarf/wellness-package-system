
import 'base_validator.dart';

class CustomValidator extends TextFieldValidator {

  final String regexFormula;

  CustomValidator(super.errorText, {required this.regexFormula});

  @override
  bool isValid(String? value) {
    RegExp regex = RegExp(regexFormula);
    return regex.hasMatch(value ?? "");
  }
}