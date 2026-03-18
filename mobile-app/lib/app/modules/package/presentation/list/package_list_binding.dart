import 'package:get/get.dart';

import '../../data/repositories/package_repository.dart';
import 'package_list_controller.dart';

class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackageListController>(
      () => PackageListController(packageRepository: Get.find<PackageRepository>()),
    );
  }
}
