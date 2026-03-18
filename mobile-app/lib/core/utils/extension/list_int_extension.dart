

extension ListIntExtension on List<int> {

  String convertListToString() {
    return map((number) => number.toString()).join(',');
  }
}
