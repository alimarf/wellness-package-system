



import '../extension/string_extension.dart';
import 'base_validator.dart';

class NumberValidator extends TextFieldValidator {
  NumberValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => value?.isNumberValid() ?? false;
}
