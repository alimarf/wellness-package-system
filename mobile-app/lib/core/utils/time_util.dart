import 'package:intl/intl.dart';

class TimeUtil {
  static int getDuration(String startDate, String finishDate) {
    if (startDate.isEmpty || finishDate.isEmpty) return 0;
    DateFormat inputFormat = DateFormat("dd MMM yyyy HH:mm:ss");

    try {
      DateTime dateStart = inputFormat.parse(startDate);
      DateTime dateFinish = inputFormat.parse(finishDate);

      return dateFinish.millisecondsSinceEpoch -
          dateStart.millisecondsSinceEpoch;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  static int getDurationSingle(String startDate) {
    if (startDate.isEmpty) return 0;

    DateFormat inputFormat = DateFormat("dd MMM yyyy HH:mm:ss");

    try {
      DateTime dateStart = inputFormat.parse(startDate);
      return dateStart.millisecondsSinceEpoch;
    } catch (e) {
      return 0;
    }
  }
}
