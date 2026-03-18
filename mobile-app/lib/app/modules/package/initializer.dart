import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class PackageInitializer {
  PackageInitializer();

  static const String packageKey = 'package';

  Future<void> run() async {
    await _initStorage();
  }

  Future<void> _initStorage() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    await Hive.openBox(packageKey);
  }
}
