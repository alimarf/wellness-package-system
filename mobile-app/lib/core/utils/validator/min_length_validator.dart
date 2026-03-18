import 'base_validator.dart';

class MinLengthValidator extends TextFieldValidator {
  final int min;

  MinLengthValidator(this.min, {required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    if(value == null) return true;
    return value.length  >= min;
  }
}

