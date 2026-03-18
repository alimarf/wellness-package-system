import 'modules/main/initializer.dart';
import 'modules/package/initializer.dart';

class AppInitializer {
  AppInitializer();

  Future<void> run() async {
    await MainInitializer().run();
    await PackageInitializer().run();
  }
}
