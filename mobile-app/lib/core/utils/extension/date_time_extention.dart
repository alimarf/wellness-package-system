import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String formatDateTime({String format = 'dd MMM HH:mm'}) {
    if (this == null) return '';
    return DateFormat(format).format(this!);
  }

  String toFormatdMMyyyy() {
    if (this == null) return '';
    DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(this!);
  }
}
