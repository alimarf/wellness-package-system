



import '../extension/string_extension.dart';

class AppJsonParserHelper {
  static int? parseInt(dynamic value) {
    try {
      if (value is int) {
        return value;
      } else if (value is String) {
        return value.convertToInt();
      }
    } catch (_) {}
    return null;
  }

  static double? parseDouble(dynamic value) {
    try {
      if (value is double) {
        return value;
      } else if (value is String) {
        return value.convertToDouble();
      }
    } catch (_) {}
    return null;
  }

  static bool? parseBool(dynamic value) {
    try {
      if (value is bool) {
        return value;
      } else if (value is String) {
        return value.toLowerCase() == 'true';
      } else if (value is int) {
        return value == 1;
      }
    } catch (_) {}
    return null;
  }

  static String? parseString(dynamic value) {
    try {
      if (value is String) {
        return value;
      } else if (value != null) {
        return value.toString();
      }
    } catch (_) {}
    return null;
  }

  static dynamic parseDynamic(dynamic value) {
    return value;
  }

  static dynamic parseList(dynamic value) {
    try {
      if (value is List || value is List<dynamic>) {
        return value;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}