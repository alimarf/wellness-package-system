import 'package:intl/intl.dart';

import 'base_validator.dart';

class DateValidator extends TextFieldValidator {
  final String format;

  DateValidator(this.format, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final DateTime dateTime = DateFormat(format).parseStrict(value!);
      return dateTime != null;
    } catch (_) {
      return false;
    }
  }
}
