import 'base_validator.dart';

class MaxLengthValidator extends TextFieldValidator {
  final int max;

  MaxLengthValidator(this.max, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    if(value == null) return true;
    return value.length <= max;
  }
}
