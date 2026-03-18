import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension IntExtension on int {
  String toRupiah() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = formatCurrency.format(this).substring(3);

    String result =
        formattedCurrency.substring(0, formattedCurrency.indexOf(','));

    if (result.contains("R")) {
      return "Rp${result.replaceAll(RegExp('R'), '-')}";
    }

    return "Rp${formattedCurrency.substring(0, formattedCurrency.indexOf(','))}";
  }

  String toThousand() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = formatCurrency.format(this).substring(3);
    String result =
        formattedCurrency.substring(0, formattedCurrency.indexOf(','));

    if (result.contains("R")) {
      return result.replaceAll(RegExp('R'), '-');
    }

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }

  String toTimerCountDown() {
    if (this < 10) {
      return "00:0$this";
    }
    return "00:$this";
  }

  double toPercentage(int target) {
    if (this == 0) return 0;
    return (this / target) * 100;
  }

  double toPercentageProgress(int target) {
    if (this == 0) return 0.01;
    print("this: ${(this / target)}");
    return (this / target);
  }

  int countLength() {
    if (this == 0) return 1;
    return toString().length;
  }

  String formatTimer(int seconds) {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    final remainingSeconds = this % 60;
    
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

extension ListIntExtension on List<int>? {
  Uint8List? toUint8List() {
    if(this == null) {
      return null;
    }

    ByteData byteData = ByteData(this!.length);

    for (int i = 0; i < this!.length; i++) {
      byteData.setInt8(i, this![i]);
    }

    ByteBuffer buffer = byteData.buffer;

    return buffer.asUint8List();
  }
}

extension IntNullableExtension on int? {
  String toRupiah() {
    if (this == null) return "Rp0";

    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = formatCurrency.format(this).substring(3);

    String result =
        formattedCurrency.substring(0, formattedCurrency.indexOf(','));

    if (result.contains("R")) {
      return "Rp${result.replaceAll(RegExp('R'), '-')}";
    }

    return "Rp${formattedCurrency.substring(0, formattedCurrency.indexOf(','))}";
  }
}
