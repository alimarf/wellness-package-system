

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

extension ListIntExtension on Uint8List? {
  Future<String?> saveAsFile() async {
    if(this == null) {
      return null;
    }

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/${DateTime.now().toIso8601String()}.jpg';

    try {
      File file = File(filePath);
      await file.writeAsBytes(this!);
      return filePath;
    } catch (e) {
      return null;
    }
  }
}
