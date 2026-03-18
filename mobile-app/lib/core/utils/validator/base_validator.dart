typedef FormFieldValidator<T> = String? Function(T? value);

abstract class FieldValidator<T> {
  String errorText;

  FieldValidator(this.errorText);

  bool isValid(T value);

  String? call(T value) {
    return isValid(value) ? null : errorText;
  }
}

class GenericRequiredValidator<T> extends FieldValidator<T> {
  GenericRequiredValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(value) {
    return value != null;
  }

  @override
  String? call(value) {
    return isValid(value) ? null : errorText;
  }
}

abstract class TextFieldValidator extends FieldValidator<String?> {
  TextFieldValidator(String errorText) : super(errorText);

  bool get ignoreEmptyValues => true;

  @override
  String? call(String? value) {
    if (value == null) return null;
    return (ignoreEmptyValues && value.isEmpty == true)
        ? null
        : super.call(value);
  }

  bool hasMatch(String pattern, String input, {bool caseSensitive = true}) =>
      RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
}

class PasswordValidator extends TextFieldValidator {
  PasswordValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return (value != null &&
        value.isNotEmpty &&
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,32}$').hasMatch(value));
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}

class PasswordSpecialCharactersValidator extends TextFieldValidator {
  PasswordSpecialCharactersValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return true;
  }

  @override
  String? call(String? value) {
    const String allowedSpecialChars = r'@$!%*?&';

    final RegExp allSpecialCharsRegex = RegExp(r'[^\w\s]');

    final Iterable<Match> matches = allSpecialCharsRegex.allMatches(value ?? '');

    final Set<String> disallowedChars = {};

    for (final match in matches) {
      final char = match.group(0);
      if (char != null && !allowedSpecialChars.contains(char)) {
        disallowedChars.add(char);
      }
    }

    if (disallowedChars.isNotEmpty) {
      errorText = errorText.replaceAll('[invalid_characters]', '[${disallowedChars.join(',')}]');
    }

    return disallowedChars.isEmpty ? null : errorText;
  }
}
