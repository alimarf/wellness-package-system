class AppString {
  static String getInitialName(String name) {
    String result = "";
    List<String> words = name.split(" ");

    for (var word in words) {
      if (word.isNotEmpty && result.length < 2) {
        result += word[0];
      }
    }

    return result.trim().toUpperCase();
  }
}
