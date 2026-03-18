import 'package:get/get.dart';

import '../../../core/networking/api_client.dart';
import 'data/data_sources/package_local_data_source.dart';
import 'data/data_sources/package_remote_data_source.dart';
import 'data/data_sources/network_manager/package_network_manager.dart';
import 'data/data_sources/storage_manager/package_network_manager.dart'
    as storage;
import 'data/repositories/package_repository.dart';
import 'initializer.dart';

class PackageDependencyInjection {
  PackageDependencyInjection();

  Future<void> init() async {
    // MANAGERS
    Get.lazyPut<PackageNetworkManager>(
      () => PackageNetworkManager(Get.find<ApiClient>().dio),
      fenix: true,
    );
    Get.lazyPut<storage.PackageStorageManager>(
      () => storage.PackageStorageManager(PackageInitializer.packageKey),
      fenix: true,
    );

    // DATASOURCES
    Get.lazyPut<PackageRemoteDataSource>(
      () => PackageRemoteDataSourceImpl(
        networkManager: Get.find<PackageNetworkManager>(),
      ),
      fenix: true,
    );
    Get.lazyPut<PackageLocalDataSource>(
      () => PackageLocalDataSourceImpl(
        storageManager: Get.find<storage.PackageStorageManager>(),
      ),
      fenix: true,
    );

    // REPOSITORIES
    Get.lazyPut<PackageRepository>(
      () => PackageRepositoryImpl(
        remoteDataSource: Get.find<PackageRemoteDataSource>(),
        localDataSource: Get.find<PackageLocalDataSource>(),
      ),
      fenix: true,
    );
  }
}
