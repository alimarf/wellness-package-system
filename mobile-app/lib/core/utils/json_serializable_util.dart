import 'package:intl/intl.dart';

class JsonSerializableUtil {
  static DateTime? fromJsonYyyyMmDdTHhMmSsZ(String? date) {
    if (date != null && date.isNotEmpty) {
      try {
        return DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(date, true).toLocal();
      } catch (e) {
        try {
          return DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true).toLocal();
        } catch (e) {
          try {
            DateTime dateTime = DateTime.parse(date);
            return dateTime;
          } catch (e) {
            return null;
          }
        }
      }
    }
    return null;
  }

  static String? toJsonYyyyMmDdTHhMmSsZ(DateTime? date) {
    if (date != null) {
      try {
        return DateFormat("yyyy-MM-ddTHH:mm:ssZ").format(date);
      } catch (e) {
        try {
          return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        } catch (e) {
          return null;
        }
      }
    }
    return null;
  }

  static int toInt(dynamic value) {
    var temp = value;
    if(value is double) {
      temp = temp.toStringAsFixed(0);
    }
    return int.parse(temp.toString());
  }

  static String toJsonString(dynamic value) {
    var temp = value;
    if(value is double) {
      temp = temp.toStringAsFixed(0);
    }
    return temp.toString();
  }
}

class DateTimeWithBool {
  final DateTime date;
  bool isScheduleYyyMmDdHhMmSs;

  DateTimeWithBool({required this.date, this.isScheduleYyyMmDdHhMmSs = true});
}
