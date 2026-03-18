import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class MainInitializer {
  MainInitializer();

  static const String mainKey = 'main';

  Future<void> run() async {
    await _initStorage();
  }

  Future<void> _initStorage() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    await Hive.openBox(mainKey);
  }
}
