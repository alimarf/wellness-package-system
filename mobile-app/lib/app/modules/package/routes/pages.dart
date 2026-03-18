import 'package:get/get.dart';

import '../presentation/list/package_list_view.dart';
import '../presentation/list/package_list_binding.dart';

part 'routes.dart';

class PackagePages {
  PackagePages._();

  static final routes = [
    GetPage(
      name: _PackagePaths.PACKAGES,
      page: () => const PackageListView(),
      binding: PackageBinding(),
    ),
  ];
}
