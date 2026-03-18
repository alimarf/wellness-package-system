import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringConverter on String {
  String decodeRupiah() {
    return (this).replaceAll("Rp", "").replaceAll(".", "");
  }

  bool isEmailValid() {
    RegExp regex = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (regex.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }

  String hash() {
    final bytes = utf8.encode(this);
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  void openUrl() {
    launch(this);
  }
}

extension NullableStringConverter on String? {
  String formatDate({
    String format = 'd MMM y',
    String locale = 'en_US',
    bool isToLocal = false,
  }) {
    try {
      if (this == null) return '';
      DateTime dateTime = DateTime.parse(this ?? '');
      final outputFormat = DateFormat(format, locale);
      String formattedDate = isToLocal
          ? outputFormat.format(dateTime.toLocal())
          : outputFormat.format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  DateTime? convertToDateTime({String? format}) {
    try {
      if (this == null) return null;

      if(format != null) {
        return DateFormat(format).parse(this!);
      }

      DateTime dateTime = DateTime.parse(this ?? '');
      return dateTime;
    } catch (e) {
      return null;
    }
  }

  String convertPhoneNumber() {
    if (this == null) return '';
    String phoneNumber = this!.replaceAll(RegExp(r'^(\+?62)'), '0');
    return phoneNumber;
  }

  int convertToInteger() {
    if (this == null) return 0;
    String digitsOnly = this!.replaceAll(RegExp(r'[^0-9]'), '');
    int result = int.tryParse(digitsOnly) ?? 0;
    return result;
  }

  double convertToDouble() {
    if (this == null) return 0;
    String digitsOnly = this!.replaceAll(RegExp(r'[^0-9]'), '');
    double result = double.tryParse(digitsOnly) ?? 0.0;
    return result;
  }

  int removeCommaAndConvertToInt() {
    if (this == null) return 0;
    String numberWithoutComma = this?.replaceAll(',', '') ?? '0';
    int convertedNumber = int.parse(numberWithoutComma);
    return convertedNumber;
  }

  String toCapitalize() {
    if (this == null || (this ?? '').isEmpty) {
      return "";
    }
    final firstChar = this?.substring(0, 1).toUpperCase();
    final restOfString = this?.substring(1).toLowerCase();
    return '$firstChar$restOfString';
  }

  String toCapitalizeEachWord() {
    if (this == null || (this ?? '').isEmpty) return "";
    String capitalizedString =
        this!.split(' ').map((word) => word.toCapitalize()).join(' ');
    return capitalizedString;
  }

  bool isEmailValid() {
    RegExp regex = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (regex.hasMatch(this ?? '')) {
      return true;
    } else {
      return false;
    }
  }
  
  bool isNumberValid() {
    int? value = this.convertToInt();
    return value != null;
  }

  bool isPhoneNumberValid() {
    return this?.startsWith("08") ?? false;
  }

  bool isTelephoneNumberValid() {
    return this?.startsWith("0") ?? false;
  }

  String formatToIdnPhone() {
    if (this == null) return '';
    if (this!.startsWith("0")) {
      String phoneNumber = this!.replaceFirst("0", "+62");
      return phoneNumber;
    }
    return "+${this!.trim()}";
  }

  String toRupiah() {
    if (this == null) return "Rp0";
    int price = int.parse(this ?? '0');
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = formatCurrency.format(price).substring(3);
    String result =
        formattedCurrency.substring(0, formattedCurrency.indexOf(','));

    if (result.contains("R")) {
      return "Rp${result.replaceAll(RegExp('R'), '-')}";
    }

    return "Rp${formattedCurrency.substring(0, formattedCurrency.indexOf(','))}";
  }

  String decodeRupiah() {
    return (this ?? "").replaceAll("Rp", "").replaceAll(".", "");
  }

  int? convertToInt() {
    String newPrice = this?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0';
    int? convertedPrice = int.tryParse(newPrice);
    return convertedPrice;
  }

  int toRawPrice() {
    if (this == null) return 0;
    final removedCurrency = this?.replaceAll(RegExp(r'[Rp.]'), '');
    return int.parse(removedCurrency ?? '0');
  }

  String toPhoneNumber() {
    if (this == null || this == '') return '-';
    String number = this ?? '';
    String newPhone = number;
    String twoFirstNumber = '${number[0]}${number[1]}';
    if (twoFirstNumber == '62') {
      String restNumber = number.substring(2, number.length);
      newPhone = '0$restNumber';
    }
    return newPhone;
  }

  String getNullValue() {
    if (this == null || this == '') return '-';
    return this ?? "-";
  }

  String convertToTime() {
    if (this == null || this == '') return "";
    // Parse the input string to a DateTime object
    final dateTime = DateFormat('HH:mm:ss').parse(this!);

    // Format the DateTime object to the desired format
    final formattedDate =
        DateFormat('HH:mm').format(dateTime.toLocal());

    return formattedDate;
  }
}
