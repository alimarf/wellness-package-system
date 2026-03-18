import 'package:intl/intl.dart';

class AppNumber {
  static String compactNumber(int value) {
    return NumberFormat.compact().format(value);
  }
}
