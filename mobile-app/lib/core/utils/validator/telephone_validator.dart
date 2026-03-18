
import '/core/utils/extension/string_extension.dart';

import 'base_validator.dart';

class TelephoneValidator extends TextFieldValidator {
  TelephoneValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => value.isTelephoneNumberValid();
}
