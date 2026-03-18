extension GetArgumentExtension on Map<String, String> {
  dynamic getOptionalArgument(String argument) {
    try {
      return this[argument];
    } catch (e) {
      return null;
    }
  }
}

extension GetArgumentDynamicExtension on Map<String, dynamic> {
  dynamic getOptionalArgument(String argument) {
    try {
      return this[argument];
    } catch (e) {
      return null;
    }
  }
}
