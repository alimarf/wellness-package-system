import 'package:get/get.dart';

import '../../../../../core/values/state/app_state.dart';
import '../../domain/entities/package/package.entity.dart';
import '../../data/repositories/package_repository.dart';

class PackageListController extends GetxController {
  final PackageRepository packageRepository;

  PackageListController({required this.packageRepository});

  final state = AppState.Initial.obs;
  final packages = <Package>[].obs;

  @override
  void onReady() {
    super.onReady();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    state.value = AppState.Loading;
    final result = await packageRepository.getPackages();
    result.fold(
      (left) {
        state.value = left.data == null || left.data!.isEmpty
            ? AppState.Empty
            : AppState.LoadComplete;
        if (left.data != null) packages.value = left.data!;
      },
      (right) {
        state.value = right.data == null || right.data!.isEmpty
            ? AppState.Empty
            : AppState.LoadComplete;
        if (right.data != null) packages.value = right.data!;
      },
    );
  }
}
