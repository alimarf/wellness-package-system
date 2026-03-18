class SettingUtil {
  static String calculateTime(int millisUntilFinished) {
    int day = ((millisUntilFinished ~/ (1000 * 60 * 60 * 24)) % 7).toInt();
    int hours = (millisUntilFinished ~/ 1000) ~/ 3600;
    int minutes = ((millisUntilFinished ~/ 1000) % 3600) ~/ 60;
    int seconds = (millisUntilFinished ~/ 1000) % 60;
    String timeLeftFormatted;

    if (day > 0) {
      timeLeftFormatted = "$day hari lagi";
    } else {
      if (hours > 0) {
        if (minutes != 0) {
          timeLeftFormatted = "$hours jam $minutes menit lagi";
        } else {
          timeLeftFormatted = "$hours jam lagi";
        }
      } else {
        if (minutes > 0) {
          if (seconds != 0) {
            timeLeftFormatted = "$minutes menit $seconds detik lagi";
          } else {
            timeLeftFormatted = "$minutes menit lagi";
          }
        } else {
          if (seconds > 0) {
            timeLeftFormatted = "$seconds detik lagi";
          } else {
            timeLeftFormatted = "0";
          }
        }
      }
    }

    return timeLeftFormatted;
  }
}
