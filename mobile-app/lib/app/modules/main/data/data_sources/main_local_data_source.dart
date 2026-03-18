import 'package:get/get_utils/get_utils.dart';

import '../../../../../core/exceptions/cache_exception.dart';
import 'storage_manager/main_storage_manager.dart';

abstract class MainLocalDataSource {
  Future<String?> getStorageVersion();
  Future cacheStorageVersion(String storageVersion);
  Future<String?> getDarkModeConfig();
  Future cacheDarkModeConfig(String darkModeConfig);
  Future<String?> getBiometricsConfig();
  Future cacheBiometricsConfig(String biometricsConfig);
  Future<String?> getLatestVersion();
  Future cacheLatestVersion(String latestVersion);
}

class MainLocalDataSourceImpl implements MainLocalDataSource {
  MainStorageManager storageManager;

  MainLocalDataSourceImpl({required this.storageManager});

  @override
  Future cacheStorageVersion(String user) async {
    try {
      storageManager.cacheStorageVersion(user);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<String?> getStorageVersion() async {
    try {
      final cache = storageManager.getStorageVersion();

      if (cache == null) {
        throw 'StorageVersion not found'.tr;
      }

      return cache;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future cacheDarkModeConfig(String darkModeConfig) async {
    try {
      storageManager.cacheDarkModeConfig(darkModeConfig);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<String?> getDarkModeConfig() async {
    try {
      final cache = storageManager.getDarkModeConfig();

      if (cache == null) {
        throw 'DarkMode not found'.tr;
      }

      return cache;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future cacheBiometricsConfig(String biometricsConfig) async {
    try {
      storageManager.cacheBiometricsConfig(biometricsConfig);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<String?> getBiometricsConfig() async {
    try {
      final cache = storageManager.getBiometricsConfig();

      if (cache == null) {
        throw 'Biometrics config not found'.tr;
      }

      return cache;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future cacheLatestVersion(String latestVersion) async {
    try {
      storageManager.cacheLatestVersion(latestVersion);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<String?> getLatestVersion() async {
    try {
      final cache = storageManager.getLatestVersion();

      if (cache == null) {
        throw 'Latest version not found'.tr;
      }

      return cache;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
