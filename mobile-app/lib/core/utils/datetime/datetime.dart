import 'package:intl/intl.dart';

class AppDateTime {
  static String format(
      {required DateTime dateTime,
      String currentFormat = 'yyyy-MM-ddTHH:mm:ssZ',
      String desiredFormat = 'yyyy-MM-dd',
      isUtc = false}) {
    final formatter = DateFormat(desiredFormat);
    return formatter.format(dateTime);
  }

  static Duration calculateDifference(
      {required DateTime from, required DateTime to}) {
    return Duration(seconds: to.difference(from).inSeconds);
  }

  static String formatTimeFromDuration(Duration duration) {
    String formattedDuration =
        "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
    return formattedDuration;
  }
}
