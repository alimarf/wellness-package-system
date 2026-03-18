
extension ListStringExtension on List<String> {

  String? convertListToString() {
    if (isEmpty) return null;
    return map((number) => number.toString()).join(',');
  }

  String? convertListToGenderFilter() {
    if (isEmpty) return null;
    return map((element) {
      if (element.toLowerCase() == "anak") return 'kids';
      if (element.toLowerCase() == "pria") return 'male';
      if (element.toLowerCase() == "wanita") return 'female';
      return element.toString().toLowerCase();
    }).join(',');
  }

  String? toLocationAddress() {
    if (isEmpty) return null;
    return join('\n');
  }
}
