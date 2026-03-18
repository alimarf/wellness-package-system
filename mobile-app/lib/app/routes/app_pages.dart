import '../modules/main/routes/pages.dart';
import '../modules/package/routes/pages.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = MainRoutes.SPLASH;

  static final routes = [
    ...MainPages.routes,
    ...PackagePages.routes,
  ];
}
