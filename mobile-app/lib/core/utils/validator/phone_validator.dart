import '/core/utils/extension/string_extension.dart';


import 'base_validator.dart';

class PhoneValidator extends TextFieldValidator {
  PhoneValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => value.isPhoneNumberValid();
}
