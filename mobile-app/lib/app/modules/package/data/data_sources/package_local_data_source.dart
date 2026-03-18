import '../../../../../core/exceptions/cache_exception.dart';
import '../../domain/entities/package/package.entity.dart';
import 'storage_manager/package_network_manager.dart' as storage;

abstract class PackageLocalDataSource {
  List<Package>? getPackages();
  void cachePackages(List<Package> packages);
}

class PackageLocalDataSourceImpl implements PackageLocalDataSource {
  final storage.PackageStorageManager storageManager;

  PackageLocalDataSourceImpl({required this.storageManager});

  @override
  List<Package>? getPackages() {
    try {
      return storageManager.getPackages();
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  void cachePackages(List<Package> packages) {
    try {
      storageManager.cachePackages(packages);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
