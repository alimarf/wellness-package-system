import 'base_validator.dart';

class RangeValidator extends TextFieldValidator {
  final num min;
  final num max;

  RangeValidator(
      {required this.min, required this.max, required String errorText})
      : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final numericValue = num.parse(value!);
      return (numericValue >= min && numericValue <= max);
    } catch (_) {
      return false;
    }
  }
}


