import 'package:get/get.dart';

import '../presentation/splash/splash_binding.dart';
import '../presentation/splash/splash_view.dart';

part 'routes.dart';

class MainPages {
  MainPages._();

  static final routes = [
    GetPage(
      name: _MainPaths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
