

extension DurationTimeExtension on Duration {
  String formatDuration() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final hours = twoDigits(inHours);
    final minutes = twoDigits(inMinutes.remainder(60));

    return '$hours:$minutes';
  }

  String formatDurationComplete() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }
    final days = twoDigits(inDays);
    final hours = twoDigits(inHours.remainder(24));
    final minutes = twoDigits(inMinutes.remainder(60));
    final seconds = twoDigits(inSeconds.remainder(60));

    if(days == '00') {
      return '$hours:$minutes:$seconds';
    }
    return '$days:$hours:$minutes:$seconds';
  }

   String formatDurationMinutes() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final minutes = twoDigits(inMinutes.remainder(60));
    final seconds = twoDigits(inSeconds%60);

    return '$minutes:$seconds';
  }
}