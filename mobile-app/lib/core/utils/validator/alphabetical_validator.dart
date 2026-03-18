
import 'base_validator.dart';

class AlphabeticalValidator extends TextFieldValidator {

  AlphabeticalValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    return regex.hasMatch(value ?? "");
  }
}