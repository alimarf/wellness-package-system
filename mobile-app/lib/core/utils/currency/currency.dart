import 'package:intl/intl.dart';

class AppCurrency {
  static String convertToIdr(dynamic number, int? decimalDigit) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit ?? 0,
    );
    return currencyFormatter.format(number);
  }
}
