extension PasswordExtention on String {
  bool isCorrectPasswordLength() {
    return length >= 8;
  }

  bool isContainsOneCapital() {
    return contains(RegExp(r'[A-Z]'));
  }

  bool isContainsOneDigit() {
    return contains(RegExp(r'\d'));
  }

  bool isContainsOneSpecialSymbol() {
    ///Check apakah ada tanda baca lain selain !@#$%^&*
    RegExp pattern1 = RegExp(r'[^\w\s!@#$%^&*]');
    bool containsInvalidChars = pattern1.hasMatch(this);

    ///Check apakah ada symbol !@#$%^&* di password
    RegExp pattern2 = RegExp(r'[!@#$%^&*]');
    bool containsValidSymbols = pattern2.hasMatch(this);

    return containsValidSymbols && !containsInvalidChars;
  }
}