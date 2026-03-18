import 'package:get/get.dart';

import 'data/data_sources/main_local_data_source.dart';
import 'data/data_sources/storage_manager/main_storage_manager.dart';
import 'data/repositories/main_repository.dart';
import 'domain/usecases/get_dark_mode_config.dart';
import 'domain/usecases/get_latest_version.dart';
import 'domain/usecases/get_storage_version.dart';
import 'domain/usecases/save_dark_mode_config.dart';
import 'domain/usecases/save_latest_version.dart';
import 'domain/usecases/save_storage_version.dart';
import 'initializer.dart';

class MainDependencyInjection {
  MainDependencyInjection();

  Future<void> init() async {
    // MANAGERS
    Get.lazyPut(() => MainStorageManager(MainInitializer.mainKey), fenix: true);

    // DATASOURCES
    Get.lazyPut(
        () => MainLocalDataSourceImpl(
            storageManager: Get.find<MainStorageManager>()),
        fenix: true);

    // REPOSITORIES
    Get.lazyPut(
        () => MainRepositoryImpl(
            localDataSource: MainLocalDataSourceImpl(
                storageManager: Get.find<MainStorageManager>())),
        fenix: true);

    // USECASES
    Get.lazyPut(() => GetStorageVersion(Get.find<MainRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => SaveStorageVersion(Get.find<MainRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => GetDarkModeConfig(Get.find<MainRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => SaveDarkModeConfig(Get.find<MainRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => GetLatestVersion(Get.find<MainRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => SaveLatestVersion(Get.find<MainRepositoryImpl>()),
        fenix: true);
  }
}
