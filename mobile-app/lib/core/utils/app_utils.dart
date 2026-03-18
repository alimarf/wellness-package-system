import 'dart:math';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static String getPhone(String code, String phoneText,
      {bool isOnlyPhone = false}) {
    String phoneCode = code;
    if (phoneCode.startsWith("+")) {
      phoneCode = phoneCode.replaceAll("+", "");
    }

    String phone = phoneText;

    if (phone.startsWith(code)) {
      phone = phone.substring(code.length);
    } else if (phone.startsWith(phoneCode)) {
      phone = phone.substring(phoneCode.length);
    } else if (phone.startsWith("0")) {
      phone = int.parse(phone).toString();
    }
    return isOnlyPhone ? phone : phoneCode + phone;
  }

  static bool falsyChecker(dynamic value) {
    bool isEmpty = false;
    bool isZero = false;
    bool isNull = value == null;
    if (value is int || value is double || value is num) {
      isZero = value == 0 || value == 0.0;
    } else {
      try {
        if (!isNull) isEmpty = value?.isEmpty;
      } catch (e) {
        isEmpty = false;
      }
    }
    return isNull || isEmpty || isZero;
  }

  Future<void> openUrl(String url) async {
    Uri parsed = Uri.parse(url);
    if (!await launchUrl(parsed)) {
      throw 'Could not launch $parsed';
    }
  }

  static void launchWA(String data) async {
    if (await canLaunchUrl(Uri.parse(data))) {
      await launchUrl(Uri.parse(data));
    } else {
      Get.snackbar("Error", 'Tidak dapat membuka WhatsApp');
    }
  }

  static String getInitialsName({required String name}) {
    if (name.isEmpty) return '';
    var buffer = StringBuffer();
    var split = name.split(' ');
    int totalSplit = split.length;
    int splitLength = totalSplit > 2 ? 2 : totalSplit;
    for (var i = 0; i < splitLength; i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }

  // static void launchGoogleMap(String? gMapUrl) async {
  //   if (gMapUrl == null || gMapUrl.isEmpty) {
  //     Get.snackbar(ProductConstant.error, ProductConstant.locNotRegistered.tr);
  //     return;
  //   }
  //   List urlList = gMapUrl.split('/');
  //   String googleUrl = '';
  //   if (urlList.length >= 7) {
  //     googleUrl = gMapUrl;
  //   } else {
  //     List coordinateList = urlList[5].split('+');
  //     double latitude = double.parse(coordinateList[0]);
  //     double longitude = double.parse(coordinateList[1]);
  //     googleUrl = sprintf(ProductConstant.googleMapUrl, [latitude, longitude]);
  //   }
  //   if (await canLaunchUrl(Uri.parse(googleUrl))) {
  //     await launchUrl(Uri.parse(googleUrl),
  //         mode: LaunchMode.externalApplication);
  //   } else {
  //     Get.snackbar(ProductConstant.error, ProductConstant.cantOpenMap.tr);
  //     throw ProductConstant.cantOpenMap.tr;
  //   }
  // }

  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final Random _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          _rnd.nextInt(chars.length),
        ),
      ),
    );
  }
}
